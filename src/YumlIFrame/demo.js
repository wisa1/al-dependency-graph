function SetUrl(newUrl)
{
    _img = document.getElementById("yumlPicture")
    _img.src = newUrl;

    _a = document.getElementById("yumlLink");
    _a.href = newUrl;
}