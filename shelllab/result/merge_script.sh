#!/bin/bash

# 设置文件夹
test_dir="test"
rtest_dir="rtest"
output_dir="output"

# 创建 output 目录
mkdir -p "$output_dir"

# 循环处理01到16号文件
for i in $(seq -w 1 16); do
    test_file="$test_dir/test$i.txt"
    rtest_file="$rtest_dir/rtest$i.txt"
    output_file="$output_dir/output$i.txt"

    # 合并内容，先写test，再写rtest，中间加一个换行
    {
        cat "$test_file"
        echo ""
        cat "$rtest_file"
    } > "$output_file"
done

echo "✅ 所有文件已成功生成到 $output_dir 文件夹中。"
