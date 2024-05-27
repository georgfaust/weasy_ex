defmodule WeasyExTest do
  use ExUnit.Case

  @html """
  <div style="height: 200mm; background: lime">
    TEST
  </div>
  """

  test "generates pdf" do
    pid = WeasyEx.start_python!()

    assert <<"%PDF", _::binary>> = WeasyEx.write_pdf(pid, @html)
  end
end
