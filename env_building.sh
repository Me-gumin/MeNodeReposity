#!/bin/bash

# ComfyUI 环境搭建脚本
# 保存为 main.sh 后在终端运行: chmod +x main.sh && ./main.sh

echo "开始搭建环境，请耐心等待☕☕☕（约10min）..."
# ---------- 仓库列表 ----------
repos=(
    "https://github.com/ltdrdata/ComfyUI-Manager.git|custom_nodes/ComfyUI-Manager"
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git|custom_nodes/ComfyUI-Advanced-ControlNet"
    "https://github.com/nullquant/ComfyUI-BrushNet.git|custom_nodes/ComfyUI-BrushNet"
    "https://github.com/crystian/ComfyUI-Crystools.git|custom_nodes/ComfyUI-Crystools"
    "https://github.com/yolain/ComfyUI-Easy-Use.git|custom_nodes/ComfyUI-Easy-Use"
    "https://github.com/kijai/ComfyUI-Florence2.git|custom_nodes/ComfyUI-Florence2"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git|custom_nodes/ComfyUI-Impact-Pack"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack.git|custom_nodes/ComfyUI-Impact-Subpack"
    "https://github.com/kijai/ComfyUI-KJNodes.git|custom_nodes/ComfyUI-KJNodes"
    "https://github.com/MinusZoneAI/ComfyUI-Kolors-MZ.git|custom_nodes/ComfyUI-Kolors-MZ"
    "https://github.com/ZHO-ZHO-ZHO/ComfyUI-Selector-CoInput-Multilingual.git|custom_nodes/ComfyUI-Selector-CoInput-Multilingual"
    "https://github.com/EllangoK/ComfyUI-post-processing-nodes.git|custom_nodes/ComfyUI-post-processing-nodes"
    "https://github.com/cubiq/ComfyUI_essentials.git|custom_nodes/ComfyUI_essentials"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git|custom_nodes/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git|custom_nodes/ComfyUI-Custom-Scripts"
    "https://github.com/BlenderNeko/ComfyUI_Cutoff.git|custom_nodes/ComfyUI_Cutoff"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git|custom_nodes/ComfyUI_IPAdapter_plus"
    "https://github.com/SLAPaper/ComfyUI-Image-Selector.git|custom_nodes/ComfyUI-Image-Selector"
    "https://github.com/LEv145/images-grid-comfy-plugin.git|custom_nodes/ComfyUI-ImagesGrid"
    "https://github.com/Jordach/comfy-plasma.git|custom_nodes/ComfyUI-Plasma"
    "https://github.com/BlenderNeko/ComfyUI_TiledKSampler.git|custom_nodes/ComfyUI_TiledKSampler"
    "https://github.com/Acly/comfyui-inpaint-nodes.git|custom_nodes/comfyui-inpaint-nodes"
    "https://github.com/jamesWalker55/comfyui-various.git|custom_nodes/comfyui-various"
    "https://github.com/Fannovel16/comfyui_controlnet_aux.git|custom_nodes/comfyui_controlnet_aux"
    "https://github.com/jags111/efficiency-nodes-comfyui.git|custom_nodes/efficiency-nodes-comfyui"
    "https://github.com/bash-j/mikey_nodes.git|custom_nodes/mikey_nodes"
    "https://github.com/rgthree/rgthree-comfy.git|custom_nodes/rgthree-comfy"
    "https://github.com/Stability-AI/stability-ComfyUI-nodes.git|custom_nodes/stability-ComfyUI-nodes"
    "https://github.com/WASasquatch/was-node-suite-comfyui.git|custom_nodes/was-node-suite-comfyui"
    "https://github.com/ZHO-ZHO-ZHO/ComfyUI-SDXL_Art_Library-Button.git|web/extensions/SDXL_Art_Library_Zho"
    "https://github.com/trumanwong/ComfyUI-NSFW-Detection.git|custom_nodes/ComfyUI-NSFW-Detection"
    "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet.git|custom_nodes/ComfyUI_Custom_Nodes_AlekPet"
    "https://github.com/Me-gumin/MeComfyuiEncrypt.git|custom_nodes/MeComfyuiEncrypt"
    "https://github.com/mirabarukaso/ComfyUI_Mira.git|custom_nodes/ComfyUI_Mira"
    "https://github.com/CoreyCorza/ComfyUI-CRZnodes.git|custom_nodes/ComfyUI-CRZnodes"
    "https://github.com/weilin9999/WeiLin-Comfyui-Tools.git|custom_nodes/WeiLin-Comfyui-Tools"
    "https://github.com/chrisgoringe/cg-image-filter.git|custom_nodes/cg-image-filter"
    "https://github.com/chengzeyi/Comfy-WaveSpeed.git|custom_nodes/Comfy-WaveSpeed"
    "https://github.com/Azornes/Comfyui-Resolution-Master.git|custom_nodes/Comfyui-Resolution-Master"
    "https://github.com/willmiao/ComfyUI-Lora-Manager.git|custom_nodes/ComfyUI-Lora-Manager"
    "https://github.com/SKBv0/ComfyUI_SKBundle.git|custom_nodes/ComfyUI_SKBundle"
    "https://github.com/Alectriciti/comfyui-adaptiveprompts.git|custom_nodes/comfyui-adaptiveprompts"
    "https://github.com/Acly/comfyui-tooling-nodes.git|custom_nodes/comfyui-tooling-nodes"
    "https://github.com/Aaalice233/ComfyUI-Danbooru-Gallery.git|custom_nodes/ComfyUI-Danbooru-Gallery"
    "https://github.com/KohakuBlueleaf/PixelOE.git|custom_nodes/PixelOE"
    "https://github.com/1038lab/ComfyUI-RMBG.git|custom_nodes/ComfyUI-RMBG"
    "https://github.com/pythongosssss/ComfyUI-WD14-Tagger.git|custom_nodes/ComfyUI-WD14-Tagger"
    "https://github.com/BlenderNeko/ComfyUI_ADV_CLIP_emb.git|custom_nodes/ComfyUI_ADV_CLIP_emb"
    "https://github.com/Extraltodeus/sigmas_tools_and_the_golden_scheduler.git|custom_nodes/sigmas_tools"
    "https://github.com/chflame163/ComfyUI_LayerStyle.git|custom_nodes/ComfyUI_LayerStyle"
    "https://github.com/MixLabPro/comfyui-mixlab-nodes.git|custom_nodes/comfyui-mixlab-nodes"
    "https://github.com/TinyTerra/ComfyUI_tinyterraNodes.git|custom_nodes/ComfyUI_tinyterraNodes"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git|custom_nodes/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/giriss/comfy-image-saver.git|custom_nodes/comfy-image-saver"
    "https://github.com/shiimizu/ComfyUI_smZNodes.git|custom_nodes/ComfyUI_smZNodes"
    "https://github.com/storyicon/comfyui_segment_anything.git|custom_nodes/comfyui_segment_anything"
    "https://github.com/KohakuBlueleaf/z-tipo-extension.git|custom_nodes/z-tipo-extension"
    "https://github.com/evanspearman/ComfyMath.git|custom_nodes/ComfyMath"
    "https://github.com/city96/ComfyUI-GGUF.git|custom_nodes/ComfyUI-GGUF"
    "https://github.com/nunchaku-tech/ComfyUI-nunchaku.git|custom_nodes/ComfyUI-nunchaku"
    "https://github.com/CY-CHENYUE/ComfyUI-Janus-Pro.git|custom_nodes/ComfyUI-Janus-Pro"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git|custom_nodes/ComfyUI_UltimateSDUpscale"
    "https://github.com/ZhiHui6/zhihui_nodes_comfyui.git|custom_nodes/zhihui_nodes_comfyui"
    "https://github.com/asagi4/comfyui-prompt-control.git|custom_nodes/comfyui-prompt-control"
)
    #"https://github.com/zml-w/ComfyUI-ZML-Image.git|custom_nodes/ComfyUI-ZML-Image"

# ========== 新增时间预测函数 ==========
get_timestamp() {
    date +%s
}

format_duration() {
    local seconds=$1
    if [[ $seconds -lt 60 ]]; then
        printf "%ds" $seconds
    elif [[ $seconds -lt 3600 ]]; then
        printf "%dm %ds" $((seconds/60)) $((seconds%60))
    else
        printf "%dh %dm %ds" $((seconds/3600)) $(( (seconds%3600)/60 )) $((seconds%60))
    fi
}

progress_bar() {
    local progress=$1
    local total=$2
    local current_time=$3
    local path=$4
    local elapsed_time=$5
    local width=50
    local percent=$((progress*100/total))
    local filled=$((progress*width/total))
    local empty=$((width-filled))
    
    # 添加颜色支持
    local color="\033[95m"  # 粉色
    local reset="\033[0m"
    path="${path#*/}"
    # ========== 时间预测逻辑 ==========
    local time_info=""
    if [[ -n "$current_time" && -n "$start_time" ]]; then
        local elapsed=$((current_time - start_time))
        if [[ $progress -gt 0 && $elapsed -gt 0 ]]; then
            local avg_time=$((elapsed / progress))
            local total_estimated=$((avg_time * total))
            local remaining_time=$((total_estimated - elapsed))
            if [[ $remaining_time -gt 0 ]]; then
                time_info=" - 剩余: $(format_duration $remaining_time)"
            fi
        fi
    fi
    

    printf "\r${color}[%s%s]${reset} %3d%% (%d/%d)${time_info} - %s" \
        "$(printf '█%.0s' $(seq 1 $filled))" \
        "$(printf '░%.0s' $(seq 1 $empty))" \
        "$percent" "$progress" "$total" "$path"
    
}

# ========== 新增全局变量 ==========
start_time=$(get_timestamp)

clone_repo() {
    local url=$1
    local path=$2
    #是否允许安装依赖，默认允许
    local enable_pip=${3:-1}
    #记录失败的仓库
    local failed=0

    # 检查目标路径是否已经存在
    if [[ -d "$path" ]]; then
        echo "✓ 已存在，跳过: $path"
        return 0
    fi
    
    #echo "正在克隆: $path"
    if ! git clone -q "$url" "$path" --recursive; then 
        #echo "✓ 成功: $path"
        failed=1

    # 自动安装依赖
    else 
        if [[ $enable_pip -eq 1 && -f "$path/requirements.txt" ]]; then
            #if ! pip install -q -r "$path/requirements.txt" > /dev/null 2>&1; then
            if ! pip install -q -r "$path/requirements.txt" > /dev/null 2>&1; then
                failed=1
            fi
        fi
    fi
    return $failed

}

# 进入工作目录
cd /kaggle/working/ || exit 1
echo "当前时间: $(date "+%Y-%m-%d %A %H:%M:%S")"
# 下载comfyui
clone_repo "https://github.com/comfyanonymous/ComfyUI.git" "ComfyUI"

if [[ ! -d "ComfyUI" ]]; then
    echo "ComfyUI 克隆失败，脚本终止"
    exit 1
fi

# 进入ComfyUI目录
cd ComfyUI/ || exit 1

# 节点库
clone_repo "https://github.com/Me-gumin/MeNodeReposity.git" "custom_nodes/MeNodeReposity" 0

# 移动文件
if [[ -f "custom_nodes/MeNodeReposity/pinggy.py" ]]; then
    mv custom_nodes/MeNodeReposity/pinggy.py ./
fi

# ---------- 主逻辑 ----------
# 批量克隆其他自定义节点
echo "仓库克隆中，请耐心等待...☕☕☕"
#获取仓库总数
total=${#repos[@]}
#记录安装的个数
count=0
#记录失败的列表
fail_list=()

for entry in "${repos[@]}"; do
    url="${entry%|*}"
    path="${entry#*|}"

    if clone_repo "$url" "$path"; then
        count=$((count + 1))
    else
        fail_list+=("$path")
    fi

    # ========== 修改：添加时间参数 ==========
    current_time=$(get_timestamp)
    progress_bar "$count" "$total" "$current_time" "$path" "$(format_duration $((current_time - start_time)))"
done

# ========== 新增总耗时显示 ==========
end_time=$(get_timestamp)
total_duration=$((end_time - start_time))
echo "⏱️ 总耗时: $(format_duration $total_duration)"

if [[ ${#fail_list[@]} -gt 0 ]]; then
    echo "⚠️ 以下仓库安装失败:"
    for f in "${fail_list[@]}"; do
        echo "   - $f"
    done
fi

echo "当前时间: $(date "+%Y-%m-%d %A %H:%M:%S")"
echo "🎉 环境搭建完成！"