# Calculator App

A beautiful, modern calculator application built with Elixir and Phoenix LiveView.

## Features

- Basic arithmetic operations: addition, subtraction, multiplication, and division
- Clear button (C) to reset the calculator
- Backspace button (⌫) to remove the last digit
- Decimal point support
- Displays current operation and result
- Button-based interaction (no typing required)
- Modern, responsive UI with gradient background

## Requirements

- Elixir 1.14 or higher
- Mix (comes with Elixir)

## Installation

1. Install dependencies:
```bash
mix deps.get
```

## Running the Application

1. Start the server:
```bash
mix run --no-halt
```

2. Open your browser and navigate to:
```
http://localhost:4000
```

## Usage

- Click number buttons (0-9) to enter numbers
- Click operation buttons (+, −, ×, ÷) to perform calculations
- Click the equals button (=) to get the result
- Click the clear button (C) to reset the calculator
- Click the backspace button (⌫) to remove the last digit
- Click the decimal point (.) to enter decimal numbers

## Project Structure

```
calculator/
├── lib/
│   ├── calculator/
│   │   ├── application.ex    # Application entry point
│   │   └── router.ex         # Routing configuration
│   └── calculator_web/
│       ├── live/
│       │   ├── calculator_live.ex      # LiveView module
│       │   └── calculator_live.html.heex  # Template
│       ├── views/
│       │   └── layout_view.ex          # Layout view
│       └── calculator_web.ex           # Web helpers
├── priv/
│   └── static/
│       └── css/
│           └── app.css       # Stylesheet
├── config/
│   └── config.exs           # Configuration
└── mix.exs                  # Project configuration
```

## Technology Stack

- **Elixir**: Functional programming language
- **Phoenix LiveView**: Real-time, interactive web applications
- **Plug Cowboy**: HTTP server
- **CSS3**: Modern styling with gradients and animations

