const offCanvas = function(caller, target){
  // Zadefinujeme zakladne premenne
  this.caller = caller;
  this.target = document.querySelector('#'+target);
  this.closers = this.target.querySelectorAll('.close');
  this.targetOpened = false;
  // Nastartujeme vsetky event listenery
  this.addEventListeners();
  //console.log(this);
}

// *************************************************************
// OPEN TARGET
// *************************************************************

offCanvas.prototype.openTarget = function openTarget(){
  const this1 = this;
  const page = document.querySelector("#page-wraper");

  this.target.classList.add("active");
  this.targetOpened = true;

  document.body.addEventListener("keyup", function(e){
    if(e.key === "Escape"){
      this1.closeTarget();
      this.removeEventListener(e.type, arguments.callee);
    }
  });

  if(this1.caller.getAttribute('data-move-page') === "true"){
    page.classList.toggle('move-page');
  }

  page.addEventListener("click", function(e){
    this1.closeTarget();
    this.removeEventListener(e.type, arguments.callee);
  })
  //console.log("target opened");
}


// *************************************************************
// CLOSE TARGET
// *************************************************************
offCanvas.prototype.closeTarget = function closeTarget(){
  const this1 = this;
  const page = document.querySelector("#page-wraper");

  this.target.classList.remove("active");
  this.targetOpened = false;
  if(page.classList.contains('move-page')){
    page.classList.toggle('move-page')
  }

  //console.log("target closed");
}

// *************************************************************
// ERROR HANDLING
// *************************************************************
offCanvas.prototype.msg = function msg(msg){
  console.log(msg[0]+": "+msg[1]);
}

// *************************************************************
// addEventListeners
// *************************************************************
offCanvas.prototype.addEventListeners = function addEventListeners(){
  const this1 = this;

  this1.closers.forEach(function(closer){
    closer.addEventListener("click", function(e){
      this1.closeTarget();
    });
  })

  this1.caller.addEventListener("click", function(e){
    // toto je tu kvoli zabraneniu dvojkliku pri zariadeniach s touch podporou
    e.stopPropagation();
    e.preventDefault();

    if(this1.targetOpened === false){
      this1.openTarget();
    }
    else{
      this1.closeTarget();
    }
  })

}

// Najdeme vsetky offcanvas triggery
const allOffCanvasCallers = document.querySelectorAll('.offcanvas-trigger');
const callers = new Array();

// Pre kazdy najdeny trigger vytvor novu classu
allOffCanvasCallers.forEach(function(caller){
   callers.push( caller, new offCanvas(caller, caller.getAttribute('data-target')) );
})
