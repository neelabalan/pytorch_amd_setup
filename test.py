import torch

is_available = torch.cuda.is_available()
print(f"GPU available? - {is_available}")
if is_available:
    print(f"GPU type - {torch.cuda.get_device_name(torch.cuda.current_device())}")