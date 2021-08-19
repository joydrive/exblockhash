defmodule ExBlockhashTest do
  use ExUnit.Case

  describe "compare_images/2" do
    test "returns true if the two supplied images are perceptually the same" do
      assert {:ok, true} ==
               ExBlockhash.Native.compare_files(
                 "test/support/lancer-original.jpg",
                 "test/support/lancer-quality-50.jpg"
               )
    end

    test "returns false if the two supplied images are perceptually different" do
      assert {:ok, false} ==
               ExBlockhash.Native.compare_files(
                 "test/support/lancer-original.jpg",
                 "test/support/unimog.png"
               )
    end

    test "returns an error if the images could not be found" do
      assert {:error, :not_found} ==
               ExBlockhash.Native.compare_files(
                 "notreal.jpg",
                 "test/support/lancer-original.jpg"
               )
    end

    test "returns an error if the images could not be decoded" do
      assert {:error, :decode_failure} ==
               ExBlockhash.Native.compare_files(
                 "test/support/notanimage.txt",
                 "test/support/lancer-original.jpg"
               )
    end
  end
end

# test compare_images/2 returns true if the two supplied images are perceptually the same (1298.9ms) [L#5]
# test compare_images/2 returns false if the two supplied images are perceptually different (1577.4ms) [L#13]
