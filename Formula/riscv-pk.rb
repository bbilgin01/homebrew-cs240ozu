class RiscvPk < Formula
  desc "RISC-V Proxy Kernel"
  homepage "http://riscv.org"
  url "https://github.com/riscv/riscv-pk.git", :using => :git, :tag => "v1.0.0"
  version "1.0.0"

  bottle do
    root_url "http://riscv.org.s3.amazonaws.com/bottles"
    rebuild 15
    sha256 cellar: :any_skip_relocation, sonoma: "45ab4dd82407aee685ffbd049ad0df0cfced02e4e3c207b4d8d2e91e4ad91351"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bca6e44547bbc7febc10f0004a007a7c0eb99e239ae99790b83c7d82a0adfbad"
  end

  depends_on "gnu-sed" => :build
  depends_on "riscv-software-src/riscv/riscv-gnu-toolchain" => :build
  depends_on "bbilgin01/homebrew-cs240ozu/riscv-isa-sim" => :build

  def install
    # Use riscv-gcc for 32-bit target
    ENV["CC"] = "riscv32-unknown-elf-gcc"

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

