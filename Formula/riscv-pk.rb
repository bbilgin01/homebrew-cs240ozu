class RiscvPk < Formula
  desc "RISC-V Proxy Kernel"
  homepage "http://riscv.org"
  url "https://github.com/riscv/riscv-pk.git"
  version "main"

  depends_on "gnu-sed" => :build
  depends_on "riscv-software-src/riscv/riscv-gnu-toolchain" => :build
  depends_on "selimsandal/cs240ozu/riscv-isa-sim" => :build

  def install
    # Use riscv-gcc for 32-bit target
    ENV["CC"] = "riscv64-unknown-elf-gcc"

    mkdir "build"
    cd "build" do
      system "../configure", "--prefix=#{prefix}", "--host=riscv32-unknown-elf", \
        "--with-arch=rv32i_zicsr_zifencei"
      # Use gnu-sed's behavior to build, modify Makefile as needed
      inreplace "Makefile", " sed", " gsed"
      system "make", "install"
    end
  end

  test do
    # A simple test to verify installation
    assert_predicate bin/"pk", :exist?
  end
end

