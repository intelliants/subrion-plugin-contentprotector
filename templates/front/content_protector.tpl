{ia_add_js}
    $(function(){
            document.onkeypress = function(event){
                event = (event || window.event);
                if (123 === event.keyCode){
                    event.preventDefault();

                    intelli.notifFloatBox({ msg: _t('content_protected'), type: 'error', autohide: true });
                }
            };

            document.onmousedown = function(event){
                event = (event || window.event);
                if (123 === event.keyCode){
                    event.preventDefault();

                    intelli.notifFloatBox({ msg: _t('content_protected'), type: 'error', autohide: true });
                }
            };

            document.onkeydown = function(event){
                event = (event || window.event);
                if (123 === event.keyCode){
                    event.preventDefault();

                    intelli.notifFloatBox({ msg: _t('content_protected'), type: 'error', autohide: true });
                }
            };

            // initialize the function return false
            function contentprotector(){
                return false;
            }

            // calling the false function in contextmenu
            document.oncontextmenu = contentprotector;

            // calling the false function in mouseup event
            document.onmouseup = contentprotector;
            var isCtrl = false;
            var isAlt = false;
            var isCmd = false;
            var isShift = false;
            var isPrint = false;
            window.onkeyup = function(e){
                if (e.which === 17)
                isCtrl = false; // make the condition when ctrl key is pressed no action has performed.

                if ((e.which === 93) || (e.which === 91) || (e.which === 224))
                isCmd = false; // make the condition when ctrl key is pressed no action has performed.
            };

            window.onkeydown = function(e){
                if (e.which === 17)
                isCtrl = true; //if onkeydown event is triggered then ctrl with possible copying keys are disabled.

                if (((e.which === 85) || (e.which === 80) || (e.which === 65) || (e.which === 88) ||(e.which === 67) || (e.which === 86) || (e.which === 83)) && isCtrl === true){
                    return false;
                }

                if (e.which === 16) {
                    isShift = true;
                }

                if (isCtrl === true && isShift === true && e.which === 73) { // for ctlr+shift+i key combination in Windows
                    return false;
                }

                if ((e.which === 93) || (e.which === 91) || (e.which === 224))
                    isCmd = true; //if onkeydown event is triggered then ctrl with possible copying keys are disabled.

                if (((e.which === 85) || (e.which === 80) || (e.which === 65) || (e.which === 88) ||(e.which === 67) || (e.which === 86) || (e.which === 83)) && isCmd === true){
                    return false;
                }

                if (e.which === 18) {
                    isAlt = true;
                }

                if (isCmd === true && isAlt === true && e.which === 73) { // for cmd+alt+i key combination in mac
                    return false;
                }
            };

            isCtrl = false;
            isCmd = false;

            document.ondragstart = contentprotector; // Dragging for Image is also Disabled(By Making Condition as false)

            document.addEventListener('contextmenu', function(e){
                e.preventDefault();

                intelli.notifFloatBox({ msg: _t('content_protected'), type: 'error', autohide: true });
            }, false);
    });
{/ia_add_js}