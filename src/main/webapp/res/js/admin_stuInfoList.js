function del() {
    const msg = "您真的确定要删除吗？\n\n请确认！";
    return confirm(msg) === true;
}