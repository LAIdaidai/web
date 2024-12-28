// 根据选择的搜索方式显示相应的输入框
function toggleSearchFields() {
    var searchBy = document.getElementById("searchBy").value;
    var searchField = document.getElementById("searchQuery");

    // 根据选择的方式调整输入框的提示信息
    if (searchBy === "title") {
        searchField.placeholder = "请输入视频名称...";
    } else if (searchBy === "category") {
        searchField.placeholder = "请输入视频类别...";
    } else if (searchBy === "region") {
        searchField.placeholder = "请输入视频地区...";
    }
}

// 页面加载时默认显示名称搜索
window.onload = function() {
    toggleSearchFields();
};
