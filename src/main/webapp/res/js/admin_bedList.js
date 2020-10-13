function delBedroom() {
    const msg = "您真的确定要删除吗？\n\n请确认！";
    return confirm(msg) === true;
}

/*获取input中的值*/
function getBedInputKey(a) {
    const inVal = document.getElementById("search_input").value;
    if(inVal != null && inVal!==''){
        a.href="/bed/getBedroom?inputBedValue="+inVal;
    }
    else{
        alert("请输入寝室号");
    }
}

// 显示所有寝室条目
function display_all(){
    const req=new XMLHttpRequest();
    req.open("post","/bed/bed_List");
    req.send();
}