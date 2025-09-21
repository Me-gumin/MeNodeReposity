#!/bin/bash

# ComfyUI 环境搭建脚本
# 保存为 main.sh 后在终端运行: chmod +x main.sh && ./main.sh

echo "开始搭建环境，请耐心等待☕☕☕（约10min）..."
echo "当前时间: $(date "+%Y-%m-%d %A %H:%M:%S")"
sum=0
# 定义克隆函数，带错误处理
clone_repo() {
    local url=$1
    local path=$2
    # 检查目标路径是否已经存在
    if [[ -d "$path" ]]; then
        #echo "✓ 已存在，跳过: $path"
        return 0
    fi
    
    #echo "正在克隆: $path"
    if git clone -q "$url" "$path"; then 
        #echo "✓ 成功: $path"
        sum=$((sum + 1))
        return 0
    else
        echo "✗ 失败: $path"
        return 1
    fi
}

# 进入工作目录
cd /kaggle/working/ || exit 1

# 下载comfyui
echo "开始克隆 ComfyUI..."
clone_repo "https://github.com/comfyanonymous/ComfyUI.git" "ComfyUI"

if [[ ! -d "ComfyUI" ]]; then
    echo "ComfyUI 克隆失败，脚本终止"
    exit 1
fi

# 进入ComfyUI目录
cd ComfyUI/ || exit 1

# 节点库
echo "开始克隆节点库..."
clone_repo "https://github.com/Me-gumin/MeNodeReposity.git" "custom_nodes/MeNodeReposity"

if [[ ! -d "custom_nodes/MeNodeReposity" ]]; then
    echo "节点库克隆失败，脚本终止"
    exit 1
fi

# 移动文件
if [[ -f "custom_nodes/MeNodeReposity/main.sh" ]]; then
    mv custom_nodes/MeNodeReposity/main.sh ./
    chmod +x main.sh
fi

if [[ -f "custom_nodes/MeNodeReposity/extra_model_paths.yaml" ]]; then
    mv custom_nodes/MeNodeReposity/extra_model_paths.yaml ./
fi

if [[ -f "custom_nodes/MeNodeReposity/pinggy.py" ]]; then
    mv custom_nodes/MeNodeReposity/pinggy.py ./
fi

# 安装依赖
echo "安装依赖中..."
if [[ -f "custom_nodes/MeNodeReposity/requirements.txt" ]]; then
    pip install -q -r ./custom_nodes/MeNodeReposity/requirements.txt
    echo "依赖安装完成！"
    echo "当前时间: $(date "+%Y-%m-%d %A %H:%M:%S")"
else
    echo "未找到 requirements.txt 文件"
fi

# 批量克隆其他自定义节点
echo "开始克隆其他自定义节点..."
echo "仓库克隆中，请耐心等待...☕☕☕"

# 开始克隆所有仓库
clone_repo "https://github.com/ltdrdata/ComfyUI-Manager.git" "custom_nodes/CMManager"
clone_repo "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git" "custom_nodes/ComfyUI-Advanced-ControlNet"
clone_repo "https://github.com/nullquant/ComfyUI-BrushNet.git" "custom_nodes/ComfyUI-BrushNet"
clone_repo "https://github.com/crystian/ComfyUI-Crystools.git" "custom_nodes/ComfyUI-Crystools"
clone_repo "https://github.com/yolain/ComfyUI-Easy-Use.git" "custom_nodes/ComfyUI-Easy-Use"
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
clone_repo "https://github.com/BlenderNeko/ComfyUI_Cutoff.git" "custom_nodes/Cut-off"
clone_repo "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git" "custom_nodes/IPAdapter-ComfyUI"
clone_repo "https://github.com/SLAPaper/ComfyUI-Image-Selector.git" "custom_nodes/Image-Selector"
clone_repo "https://github.com/LEv145/images-grid-comfy-plugin.git" "custom_nodes/ImagesGrid"
clone_repo "https://github.com/Jordach/comfy-plasma.git" "custom_nodes/Plasma"
clone_repo "https://github.com/BlenderNeko/ComfyUI_TiledKSampler.git" "custom_nodes/TiledKSampler"
clone_repo "https://github.com/Acly/comfyui-inpaint-nodes.git" "custom_nodes/comfyui-inpaint-nodes"
clone_repo "https://github.com/jamesWalker55/comfyui-various.git" "custom_nodes/comfyui-various"
clone_repo "https://github.com/Fannovel16/comfyui_controlnet_aux.git" "custom_nodes/comfyui_controlnet_aux"
clone_repo "https://github.com/jags111/efficiency-nodes-comfyui.git" "custom_nodes/efficiency-nodes-comfyui"
clone_repo "https://github.com/bash-j/mikey_nodes.git" "custom_nodes/mikey_nodes"
clone_repo "https://github.com/rgthree/rgthree-comfy.git" "custom_nodes/rgthree-comfy"
clone_repo "https://github.com/Stability-AI/stability-ComfyUI-nodes.git" "custom_nodes/stability-ComfyUI-nodes"
clone_repo "https://github.com/WASasquatch/was-node-suite-comfyui.git" "custom_nodes/was-node-suite-comfyui"
clone_repo "https://github.com/ZHO-ZHO-ZHO/ComfyUI-SDXL_Art_Library-Button.git" "web/extensions/SDXL_Art_Library_Zho"
clone_repo "https://github.com/trumanwong/ComfyUI-NSFW-Detection.git" "custom_nodes/ComfyUI-NSFW-Detection"
clone_repo "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git" "custom_nodes/ComfyUI_Custom_Nodes_AlekPet"
clone_repo "https://github.com/Me-gumin/MeComfyuiEncrypt.git" "custom_nodes/MeComfyuiEncrypt"
#add
clone_repo "https://github.com/mirabarukaso/ComfyUI_Mira.git" "custom_nodes/ComfyUI_Mira"
clone_repo "https://github.com/CoreyCorza/ComfyUI-CRZnodes.git" "custom_nodes/CRZnodes"
clone_repo "https://github.com/weilin9999/WeiLin-Comfyui-Tools.git" "custom_nodes/WeiLin-Comfyui-Tools"
clone_repo "https://github.com/chrisgoringe/cg-image-filter.git" "custom_nodes/cg-image-filter"
clone_repo "https://github.com/chengzeyi/Comfy-WaveSpeed.git" "custom_nodes/Comfy-WaveSpeed"
clone_repo "https://github.com/Azornes/Comfyui-Resolution-Master.git" "custom_nodes/Comfyui-Resolution-Master"
clone_repo "https://github.com/willmiao/ComfyUI-Lora-Manager.git" "custom_nodes/ComfyUI-Lora-Manager"
clone_repo "https://github.com/SKBv0/ComfyUI_SKBundle.git" "custom_nodes/ComfyUI_SKBundle"
clone_repo "https://github.com/Alectriciti/comfyui-adaptiveprompts.git" "custom_nodes/comfyui-adaptiveprompts"
clone_repo "https://github.com/Acly/comfyui-tooling-nodes.git" "custom_nodes/comfyui-tooling-nodes"
clone_repo "https://github.com/Aaalice233/ComfyUI-Danbooru-Gallery.git" "custom_nodes/ComfyUI-Danbooru-Gallery"
clone_repo "https://github.com/KohakuBlueleaf/PixelOE.git" "custom_nodes/PixelOE"
clone_repo "https://github.com/1038lab/ComfyUI-RMBG.git" "custom_nodes/ComfyUI-RMBG"
clone_repo "https://github.com/pythongosssss/ComfyUI-WD14-Tagger.git" "custom_nodes/ComfyUI-WD14-Tagger"
clone_repo "https://github.com/asagi4/comfyui-prompt-control.git" "custom_nodes/comfyui-prompt-control"

echo "所有仓库克隆完成！（共$sum个）"
echo "当前时间: $(date "+%Y-%m-%d %A %H:%M:%S")"
echo "已成功环境搭建！"
