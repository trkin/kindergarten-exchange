var toggle = true;
var navbarMenuButton = document.getElementById("navbar__menuButton");
var navbarCloseButton = document.getElementById("navbar__closeButton");
var navbar = document.getElementById("navbar");
var faqParagraph = document.getElementsByClassName("FAQParagraph");
var faqButton = document.getElementsByClassName("FAQButton");
navbarMenuButton.addEventListener("click",navbarToggle);
navbarCloseButton.addEventListener("click",navbarToggle);

for(let i = 0; i < faqButton.length; i++)
{
    faqButton[i].addEventListener("click", function(){
        console.log("function called");
        if(faqParagraph[i].style.display === "block" )
        {
            faqParagraph[i].style.display = "none";
        }else
        {
            faqParagraph[i].style.display = "block";
        }
    });
}

function navbarToggle()
{
    if(toggle === false)
    {
        navbar.style.display = "none";
        toggle = true;
    }else
    {
        navbar.style.display = "block";
        toggle = false;
    }

}

function fixTailwind()
{
    if(window.screen.availWidth >= 768)
    {
        navbar.style.display = "block";
        toggle = false;
    }
    setTimeout(fixTailwind, 1000);
}

fixTailwind();