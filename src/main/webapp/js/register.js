function validateForm() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (username === "" || password === "" || confirmPassword === "") {
        alert("所有字段均为必填项！");
        return false;
    }

    if (password !== confirmPassword) {
        alert("两次输入的密码不一致！");
        return false;
    }

    return true;
}