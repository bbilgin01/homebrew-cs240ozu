# homebrew-cs240ozu

Dependencies: 

    - riscv-gnu-toolchain multilib enabled (If you have installed
    homebrew-riscv with multilib enabled you should not have any issues) 
    - If not you will get: Error: No formula found for riscv-gnu-toolchain.
    

This is a brew formula for riscv32-bit Spike and pk tools.
If you already have 32-bit capabilites or you want 64-bit tools to remain please do not follow this.

To switch your brew installed riscv-tools from 64-bit to 32-bit

  if you already have Spike and pk installed with 64-bit please run these arguments before proceeding with installation:
        
    $ brew cleanup
    $ brew uninstall riscv-pk
    $ brew uninstall riscv-isa-sim
  if you have any issues with uninstallations try with "--ignore-dependencies"

    $ brew uninstall --ignore-dependencies riscv-pk
    $ brew uninstall --ignore-dependencies riscv-isa-sim

  Now you have uninstalled your riscv-isa-sim (Spike) and riscv-pk (pk proxy kernel)

  To install 32-bit using this special brew formula: 

    $ brew tap bbilgin01/homebrew-cs240ozu
    $ brew install bbilgin01/homebrew-cs240ozu/riscv-isa-sim
    $ brew install bbilgin01/homebrew-cs240ozu/riscv-pk

  After you complete these steps without any errors. You should be able to simulate your 32-bit RISC-V executables with spike:

    $ spike --isa=rv32i pk  {your_executable}
    
