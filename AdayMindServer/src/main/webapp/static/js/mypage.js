window.onload = function() {
function onClick() {
document.querySelector(".b").style.display = "block";
document.querySelector(".main_newpage").style.display = "block";
document.querySelector("header").style.opacity = "0.3";
document.querySelector("section.a").style.opacity = "0.3";
document.querySelector("section.a").classList.add("active");
}
function offClick() {
document.querySelector(".b").style.display = "none";
document.querySelector(".main_newpage").style.display = "none";
document.querySelector("header").style.opacity = "1";
document.querySelector("section.a").style.opacity = "1";
document.querySelector("section.a").classList.remove("active");
}
document.getElementById("modal_btn").addEventListener("click", onClick);
document.getElementById("modal_x").addEventListener("click", offClick);
};