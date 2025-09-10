#!/bin/bash

# ComfyUI 子模块批量克隆脚本
# 保存为 clone_all.sh 后在终端运行: chmod +x clone_all.sh && ./clone_all.sh

#echo "开始克隆所有 ComfyUI 自定义节点..."
#echo "=========================================="

# 定义克隆函数，带错误处理
clone_repo() {
    local url=$1
    local path=$2
#   echo "正在克隆: $path"
    if git clone -q "$url" "$path"; then 
        #echo "✓ 成功: $path"
        return 0
    else
        echo "✗ 失败: $path"
        return 1
    fi
    #echo "------------------------------------------"
}

# 开始克隆所有仓库
clone_repo "https://github.com/ltdrdata/ComfyUI-Manager.git" "custom_nodes/CMManager"
clone_repo "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git" "custom_nodes/ComfyUI-Advanced-ControlNet"
clone_repo "https://github.com/nullquant/ComfyUI-BrushNet.git" "custom_nodes/ComfyUI-BrushNet"
clone_repo "https://github.com/crystian/ComfyUI-Crystools.git" "custom_nodes/ComfyUI-Crystools"
clone_repo "https://github.com/yolain/ComfyUI-Easy-Use" "custom_nodes/ComfyUI-Easy-Use"
clone_repo "https://github.com/kijai/ComfyUI-Florence2.git" "custom_nodes/ComfyUI-Florence2"
clone_repo "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git" "custom_nodes/ComfyUI-Impact-Pack"
clone_repo "https://github.com/ltdrdata/ComfyUI-Impact-Subpack.git" "custom_nodes/ComfyUI-Impact-Subpack"
clone_repo "https://github.com/kijai/ComfyUI-KJNodes.git" "custom_nodes/ComfyUI-KJNodes"
clone_repo "https://github.com/MinusZoneAI/ComfyUI-Kolors-MZ.git" "custom_nodes/ComfyUI-Kolors-MZ"
clone_repo "https://github.com/ZHO-ZHO-ZHO/ComfyUI-Selector-CoInput-Multilingual.git" "custom_nodes/ComfyUI-Selector-CoInput-Multilingual"
clone_repo "https://github.com/EllangoK/ComfyUI-post-processing-nodes.git" "custom_nodes/ComfyUI-post-processing-nodes"
clone_repo "https://github.com/cubiq/ComfyUI_essentials.git" "custom_nodes/ComfyUI_essentials"
clone_repo "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git" "custom_nodes/Comfyroll_CustomNodes"
clone_repo "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git" "custom_nodes/Custom-Scripts"
clone_repo "https://github.com/BlenderNeko/ComfyUI_Cutoff" "custom_nodes/Cut-off"
clone_repo "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git" "custom_nodes/IPAdapter-ComfyUI"
clone_repo "https://github.com/SLAPaper/ComfyUI-Image-Selector.git" "custom_nodes/Image-Selector"
clone_repo "https://github.com/LEv145/images-grid-comfy-plugin.git" "custom_nodes/ImagesGrid"
clone_repo "https://github.com/AIrjen/OneButtonPrompt" "custom_nodes/OneButtonPrompt"
clone_repo "https://github.com/Jordach/comfy-plasma.git" "custom_nodes/Plasma"
clone_repo "https://github.com/BlenderNeko/ComfyUI_TiledKSampler.git" "custom_nodes/TiledKSampler"
clone_repo "https://github.com/Acly/comfyui-inpaint-nodes.git" "custom_nodes/comfyui-inpaint-nodes"
clone_repo "https://github.com/jamesWalker55/comfyui-various.git" "custom_nodes/comfyui-various"
clone_repo "https://github.com/Fannovel16/comfyui_controlnet_aux.git" "custom_nodes/comfyui_controlnet_aux"
clone_repo "https://github.com/jags111/efficiency-nodes-comfyui.git" "custom_nodes/efficiency-nodes-comfyui"
clone_repo "https://github.com/bash-j/mikey_nodes.git" "custom_nodes/mikey_nodes"
clone_repo "https://github.com/rgthree/rgthree-comfy.git" "custom_nodes/rgthree-comfy"
clone_repo "https://github.com/Stability-AI/stability-ComfyUI-nodes.git" "custom_nodes/stability-ComfyUI-nodes"
clone_repo "https://github.com/WASasquatch/was-node-suite-comfyui" "custom_nodes/was-node-suite-comfyui"
clone_repo "https://github.com/wandaweb/jupyter-webui-tunneling.git" "pinggy"
clone_repo "https://github.com/ZHO-ZHO-ZHO/ComfyUI-SDXL_Art_Library-Button.git" "web/extensions/SDXL_Art_Library_Zho"
clone_repo "https://github.com/trumanwong/ComfyUI-NSFW-Detection.git" "custom_nodes/ComfyUI-NSFW-Detection"
clone_repo "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git" "custom_nodes/ComfyUI_Custom_Nodes_AlekPet"

#echo "=========================================="
echo "所有仓库克隆完成！"
#echo "请检查是否有失败的克隆操作。"
