var check = $("input[type='checkbox']");
            check.click(function(){
                $("p").toggle();
            });
            
            var video = document.querySelector("#videoElement");
 
            if (navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                video.srcObject = stream;
                })
                .catch(function (err0r) {
                console.log("Something went wrong!");
                });
            }
