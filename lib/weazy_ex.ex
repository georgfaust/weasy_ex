defmodule WeasyEx do
  @python_bin to_charlist(Path.join([:code.priv_dir(:weasy_ex), ".venv/bin/python3"]))
  @python_path to_charlist(Path.join([:code.priv_dir(:weasy_ex), "python"]))

  def start_python!() do
    case :python.start(python: @python_bin, python_path: @python_path) do
      {:ok, pid} -> pid
      error -> raise(inspect(error))
    end
  end

  def write_pdf(pid, html) do
    WeasyEx.call_python(pid, :weasyprint_html, :write_pdf, [html])
  end

  def call_python(pid, module, function, arguments \\ []) do
    :python.call(pid, module, function, arguments)
  end
end
