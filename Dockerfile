FROM rocm/dev-ubuntu-22.04

ENV HSA_OVERRIDE_GFX_VERSION=10.3.0

RUN pip3 install --extra-index-url https://download.pytorch.org/whl/rocm5.2