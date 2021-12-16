/**
 * 
 */
 
 // 날짜 자바스크립트 소스
    var date; 
    $(document).ready(function () { 
        startDate(); 
    }); 

    function startDate() { 
        date = setInterval(function () { 
            var dateString = "현재 날짜/시간"; 
			var yoil = "";
			var time = "";
            var newDate = new Date(); 

            yoil += newDate.getFullYear() + "년 "; 
            yoil += ("0" + (newDate.getMonth() + 1)).slice(-2) + "월 "; //월은 0부터 시작하므로 +1을 해줘야 한다. 
            yoil += ("0" + newDate.getDate()).slice(-2) + "일"; 
            time += ("0" + newDate.getHours()).slice(-2) + ":"; 
            time += ("0" + newDate.getMinutes()).slice(-2) + ":"; 
            time += ("0" + newDate.getSeconds()).slice(-2);
            
            $("#date").text(dateString); 
            $("#yoil").text(yoil); 
            $("#time").text(time); 
        }, 1000); 
    } 

    function stopDate() { 
        clearInterval(date); 
    } 