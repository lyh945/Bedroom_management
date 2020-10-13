function delStu() {
    const msg = "您真的确定要删除吗？\n\n请确认！";
    return confirm(msg) === true;
}

/*获取input中的值*/
function getStuInputKey(a) {
    const inStuVal = document.getElementById("search_input").value;
    if(inStuVal != null && inStuVal!==''){
        a.href="/stuInfo/getStuInfo?inputStuValue="+inStuVal;
    }
    else{
        alert("请输入学号");
    }
}
