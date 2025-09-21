from .ComfyUI_Nudenet.Nudenet import (
    NODE_CLASS_MAPPINGS as Nudenet_NODE_CLASS_MAPPINGS,
    NODE_DISPLAY_NAME_MAPPINGS as Nudenet_NODE_DISPLAY_NAME_MAPPINGS,
)
from .MaskOverlayNode.mask_overlay_node import MaskOverlayNode

# 合并映射
NODE_CLASS_MAPPINGS = {
    **Nudenet_NODE_CLASS_MAPPINGS,
    "MaskOverlayNode": MaskOverlayNode,
}

NODE_DISPLAY_NAME_MAPPINGS = {
    **Nudenet_NODE_DISPLAY_NAME_MAPPINGS,
    "MaskOverlayNode": "Mask Overlay Node",
}

__all__ = ["NODE_CLASS_MAPPINGS", "NODE_DISPLAY_NAME_MAPPINGS"]
