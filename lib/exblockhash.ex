defmodule ExBlockhash do
  @moduledoc """
  Documentation for `ExBlockhash`.
  """

  @doc """
  Compares two images files perceptually using the blockhash144
  algorithm.

  ## Example

  ```
  iex(1)> ExBlockhash.Native.compare_files(
  ...(1)>     "test/support/lancer-original.jpg",
  ...(1)>     "test/support/lancer-quality-50.jpg"
  ...(1)>   )
  {:ok, true}
  ```
  """
  @spec compare_files(String.t(), String.t()) ::
          {:ok, boolean()} | {:error, :not_found | :decode_failure}
  def compare_files(image_path_a, image_path_b) do
    ExBlockhash.Native.compare_files(image_path_a, image_path_b)
  end
end
