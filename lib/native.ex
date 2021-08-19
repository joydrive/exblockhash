defmodule ExBlockhash.Native do
  use Rustler, otp_app: :exblockhash, crate: "exblockhash_native"

  # When your NIF is loaded, it will override this function.
  def compare_files(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
