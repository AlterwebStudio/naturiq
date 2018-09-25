//
// ##     ##    ###    ########   ######
// ##     ##   ## ##   ##     ## ##    ##
// ##     ##  ##   ##  ##     ## ##
// ##     ## ##     ## ########   ######
//  ##   ##  ######### ##   ##         ##
//   ## ##   ##     ## ##    ##  ##    ##
//    ###    ##     ## ##     ##  ######

let submenuVars = {
    mobileMenuClassName     : "mobile-menu",
    mobileMenuItemClassName : "menu_item",
    submenuClassName        : "submenu",
    hasSubmenuClassName     : "has-submenu",
    submenuBackButtonText   : "Späť",
    submenuBackButtonClass  : "submenu_back",
    submenuBackButtonClasses: ["menu_item"],
};

let submenuBackButtonContent = "<i class='fa fa-chevron-left' aria-hidden='true'></i>"+submenuVars.submenuBackButtonText;


//  ######  ##          ###     ######   ######      ######  ##     ## ########  ##     ## ######## ##    ## ##     ##
// ##    ## ##         ## ##   ##    ## ##    ##    ##    ## ##     ## ##     ## ###   ### ##       ###   ## ##     ##
// ##       ##        ##   ##  ##       ##          ##       ##     ## ##     ## #### #### ##       ####  ## ##     ##
// ##       ##       ##     ##  ######   ######      ######  ##     ## ########  ## ### ## ######   ## ## ## ##     ##
// ##       ##       #########       ##       ##          ## ##     ## ##     ## ##     ## ##       ##  #### ##     ##
// ##    ## ##       ##     ## ##    ## ##    ##    ##    ## ##     ## ##     ## ##     ## ##       ##   ### ##     ##
//  ######  ######## ##     ##  ######   ######      ######   #######  ########  ##     ## ######## ##    ##  #######

// CONSTRUCTOR
const SubMenu = function(item, submenu){
  this.item = item;
  this.submenu = submenu;
  this.back = this.submenu.querySelector("."+submenuVars.submenuBackButtonClass);
  this._addEventListeners();
}

// SLIDE SUBMENU IN
SubMenu.prototype.slideIn = function slideIn(){
  const this1 = this;
  this1.submenu.style.transform = "translateX(0%)";
  console.log("slide in");
}

// SLIDE SUBMENU OUT
SubMenu.prototype.slideOut = function slideOut(){
  const that = this;

  that.submenu.style.transform = "translateX(100%)";
  console.log("slide out");
}

// EVENT LISTENERS
SubMenu.prototype._addEventListeners = function _addEventListeners(){
  const that = this;

  this.item.addEventListener("click", function(e){
    // AK MA LINK REALNY HREF IGNORUJ SKRIPT A PREKLIKNI SA
    if(e.target.getAttribute("href") == "#"){
      // toto je tu kvoli zabraneniu dvojkliku pri zariadeniach s touch podporou
      e.stopPropagation();
      e.preventDefault();

      that.slideIn(); 
    }

  })

  this.back.addEventListener("click", function(e){
    // toto je tu kvoli zabraneniu dvojkliku pri zariadeniach s touch podporou
    e.stopPropagation();
    e.preventDefault();
    that.slideOut();
  })
}


// #### ##    ## #### ########
//  ##  ###   ##  ##     ##
//  ##  ####  ##  ##     ##
//  ##  ## ## ##  ##     ##
//  ##  ##  ####  ##     ##
//  ##  ##   ###  ##     ##
// #### ##    ## ####    ##


// NAJDEME VSETKY MENU ITEMY, KTORE MAJU VNORENE UL (SUBMENU) A SPUSTIME CLASSU
const allMobileMenuItems = document.querySelectorAll("."+submenuVars.mobileMenuClassName+" ."+submenuVars.mobileMenuItemClassName);

allMobileMenuItems.forEach(function(menuItem){
  if(menuItem.querySelector('ul')){
    // Pridame classu itemu. ktory oznaci ze polozka ma submenu (.has-submenu)
    menuItem.classList.add(submenuVars.hasSubmenuClassName)

    // SUBMENU
    // pridame classu samotnemu submenu (.submenu)
    const submenu = menuItem.querySelector('ul');
          submenu.classList.add(submenuVars.submenuClassName)

    // SUBMENU - BACK BUTTON
    // pridame back button do submenu (aby bolo mozne sa vratit)
    const backButton = document.createElement("li");
          backButton.classList.add(submenuVars.mobileMenuItemClassName);

    const backButtonInner = document.createElement("a")
          backButtonInner.classList.add(submenuVars.submenuBackButtonClass);
          backButtonInner.setAttribute('href', "#");
          backButtonInner.innerHTML = submenuBackButtonContent;

          if(submenuVars.submenuBackButtonClasses){
            submenuVars.submenuBackButtonClasses.forEach(function(cls){
              backButtonInner.classList.add(cls);
            })
          }

          backButton.appendChild(backButtonInner);
          //console.log(backButton);

    submenu.insertBefore(backButton, submenu.childNodes[0]);

    new SubMenu(menuItem, submenu);
  }
})
