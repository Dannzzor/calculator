defmodule CalculatorWeb.CalculatorLive do
  use CalculatorWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, 
      display: "0", 
      current_value: 0, 
      previous_value: nil, 
      operation: nil, 
      waiting_for_new_value: false,
      just_calculated: false
    )
    {:ok, update_operation_display(socket)}
  end

  def handle_event("number", %{"value" => value}, socket) do
    new_display = cond do
      socket.assigns.waiting_for_new_value || socket.assigns.just_calculated ->
        value
      socket.assigns.display == "0" ->
        value
      true ->
        socket.assigns.display <> value
    end

    current_value = parse_number(new_display)
    socket = assign(socket, 
      display: new_display, 
      current_value: current_value, 
      waiting_for_new_value: false,
      just_calculated: false
    )
    {:noreply, update_operation_display(socket)}
  end

  def handle_event("operation", %{"op" => op}, socket) do
    socket = cond do
      # If we just calculated and user presses an operation, use the result as previous
      socket.assigns.just_calculated ->
        assign(socket, 
          previous_value: socket.assigns.current_value, 
          operation: op, 
          waiting_for_new_value: true,
          just_calculated: false
        )
      # If there's an existing operation and we have both values, calculate first
      socket.assigns.operation && socket.assigns.previous_value && !socket.assigns.waiting_for_new_value ->
        result = calculate(socket.assigns.previous_value, socket.assigns.current_value, socket.assigns.operation)
        display = format_result(result)
        assign(socket, 
          display: display, 
          current_value: result, 
          previous_value: result, 
          operation: op, 
          waiting_for_new_value: true,
          just_calculated: false
        )
      # If we're waiting for a new value, just change the operation
      socket.assigns.waiting_for_new_value ->
        assign(socket, operation: op)
      # Otherwise, store current as previous and set operation
      true ->
        assign(socket, 
          previous_value: socket.assigns.current_value, 
          operation: op, 
          waiting_for_new_value: true,
          just_calculated: false
        )
    end
    {:noreply, update_operation_display(socket)}
  end

  def handle_event("equals", _params, socket) do
    socket = if socket.assigns.operation && socket.assigns.previous_value && !socket.assigns.waiting_for_new_value do
      result = calculate(socket.assigns.previous_value, socket.assigns.current_value, socket.assigns.operation)
      display = format_result(result)
      assign(socket, 
        display: display, 
        current_value: result, 
        previous_value: result, 
        operation: nil, 
        waiting_for_new_value: true,
        just_calculated: true
      )
    else
      socket
    end
    {:noreply, update_operation_display(socket)}
  end

  def handle_event("clear", _params, socket) do
    socket = assign(socket, 
      display: "0", 
      current_value: 0, 
      previous_value: nil, 
      operation: nil, 
      waiting_for_new_value: false,
      just_calculated: false
    )
    {:noreply, update_operation_display(socket)}
  end

  def handle_event("backspace", _params, socket) do
    socket = if String.length(socket.assigns.display) > 1 do
      new_display = String.slice(socket.assigns.display, 0, String.length(socket.assigns.display) - 1)
      current_value = parse_number(new_display)
      assign(socket, 
        display: new_display, 
        current_value: current_value, 
        waiting_for_new_value: false,
        just_calculated: false
      )
    else
      assign(socket, 
        display: "0", 
        current_value: 0, 
        waiting_for_new_value: false,
        just_calculated: false
      )
    end
    {:noreply, update_operation_display(socket)}
  end

  def handle_event("decimal", _params, socket) do
    socket = cond do
      socket.assigns.waiting_for_new_value || socket.assigns.just_calculated ->
        assign(socket, 
          display: "0.", 
          current_value: 0, 
          waiting_for_new_value: false,
          just_calculated: false
        )
      String.contains?(socket.assigns.display, ".") ->
        socket
      true ->
        new_display = socket.assigns.display <> "."
        assign(socket, display: new_display, just_calculated: false)
    end
    {:noreply, update_operation_display(socket)}
  end

  defp calculate(a, b, "add"), do: a + b
  defp calculate(a, b, "subtract"), do: a - b
  defp calculate(a, b, "multiply"), do: a * b
  defp calculate(a, b, "divide"), do: if(b == 0, do: 0, else: a / b)

  defp parse_number(str) do
    case Float.parse(str) do
      {num, _} -> num
      :error -> 0.0
    end
  end

  defp format_result(result) do
    result
    |> Float.round(10)
    |> to_string()
    |> String.replace(~r/\.0+$/, "")
    |> String.replace(~r/\.(\d*?)0+$/, ".\\1")
  end

  defp update_operation_display(socket) do
    operation_display = if socket.assigns.operation && socket.assigns.previous_value do
      format_result(socket.assigns.previous_value) <> " " <> operation_symbol(socket.assigns.operation)
    else
      ""
    end
    assign(socket, operation_display: operation_display)
  end

  defp operation_symbol("add"), do: "+"
  defp operation_symbol("subtract"), do: "−"
  defp operation_symbol("multiply"), do: "×"
  defp operation_symbol("divide"), do: "÷"
end
