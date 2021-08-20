defmodule ExBlockhash.Native do
  @moduledoc """
  The binding to native code. These functions will be replaced by the
  dynamically linked library functions when loaded.
  """
  use Rustler, otp_app: :exblockhash, crate: "exblockhash_native"

  def compare_files(_path_a, _path_b), do: :erlang.nif_error(:nif_not_loaded)
end
