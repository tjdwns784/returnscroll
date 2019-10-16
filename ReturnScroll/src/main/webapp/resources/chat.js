$(document).ready(function() {
	// 채팅에 접속 
    var socket = io("http://192.168.0.15:82");  
	
  // 2. 소켓에 이벤트를 등록하여 접속 됬음을 알게 되면 사용자의 이름을 받는다
    // (세션이 있었다면 : 이름, 아이디 사용)
    var user_name ="";
    var user_nick = $('#nick').val(); 
    var user_id = $('#userid').val();
    var room_num = $('#roomNumber').val();

    socket.on('connect', function(){
      // user_name = prompt('익명 닉네임 이름');
      console.log('회원의 닉네임' +user_nick);
      // 서버로 닉네임을 전송 => 서버에 있는 이벤트를 발생시킨다
      console.log("roomNumber는 무엇이냐 : "+room_num);
      socket.emit('s_send_userId',user_id);
      socket.emit('s_send_userName', user_nick, new Date(), room_num);
    })
    
    socket.on('disconnect',function(){
    	console.log('연결이 안되었을때')
    })
    
    // 서버가 메시지를 보내면 채팅창에 표시
    socket.on('c_send_msg', (sender, msg, time) => {
      console.log(sender, msg, time);
      // 메시지를 화면에 표시
      addMsg(sender, msg, time);
    })
    
    // 현재 대화방 참여자 목록을 표시... 배열을 받음
    socket.on('c_send_member', (member) => {
      console.log('입장한 방에 현재 멤버(member)는' + member[0].nick);
      // 참여자를 화면에 표시
      memberShow(member);
    })
    
    function memberShow(member){
    	// $("#memberList").empty();
    	console.log('여기로 들어오는지...')
    	var html = "";
    	for(var i =0 ; i<Object.keys( member ).length ; i++){
    		console.log('member속성 : '+i+", 값 : "+member[i]+", 닉네임을 : "+member[i].nick);
    		html += "<div class='dropdown' style='float: left;'><button class='btn btn-default' type='button' data-toggle='dropdown' style='border: none;background: none; display: inline-block;'>"+member[i].nick+"";
    		html += "<span class='caret'></span></button>"
			html += "<ul class='dropdown-menu' style='list-style:none;'>"
			html += "<li><a href='/returnscroll/tmap' class='dropdown-item' style='padding-bottom:10px;padding-top:10px;'>현재위치확인</a></li>"
//			html += "<li><a href='#' class='dropdown-item disabled' style='padding-bottom:10px;padding-top:10px;'>회원정보보기</a></li>"
			html += "</ul></div>";
    	}

    	/*for(var i=0;i<member.length;i++){
    		users += member[i] + "님  ";
    	}*/
    	$("#memberList").append(html);
    	//$("#members").append(users);
    }
    
    // 현재 대화방 참여자 목록을 표시... 배열을 받음
    socket.on('c_send_updateMember', (member) => {
      console.log('새로운 사람 : '+member);
      // 참여자를 화면에 표시
      memberUpdate(member);
    })
    
    function memberUpdate(member){
    	// 해당 태그 내부요소들을 비움(?)
    	$("#memberList").empty();
    	console.log('[update] 여기로 들어오는지...')
    	var html = "";
    	for(var i =0;i<Object.keys( member ).length;i++){
    		console.log('member속성 : '+i+", 값 : "+member[i]+", 닉네임을 : "+member[i].nick);
    		html += "<div class='dropdown' style='" +
    				"float: left;'><button class='btn btn-default' type='button' data-toggle='dropdown' style='border: none;background: none; display: inline-block;'>"+member[i].nick+"";
    		html += "<span class='caret'></span></button>"
			html += "<ul class='dropdown-menu' style='list-style:none;'>"
			html += "<li><a href='/returnscroll/tmap' class='dropdown-item' style='padding-bottom:10px;padding-top:10px;'>현재위치확인</a></li>"
//			html += "<li><a href='#' class='dropdown-item disabled' style='padding-bottom:10px;padding-top:10px;'>회원정보보기</a></li>"
			html += "</ul></div>";
    	}

    	/*for(var i=0;i<member.length;i++){
    		users += member[i] + "님  ";
    	}*/
    	$("#memberList").append(html);
    }

    // 클라이언트가 메시지를 작성하고, 엔터 or send키 클릭을 통해서 메시지를 서버로 전송
    // 엔터 이벤트 => keypress 이벤트
    // 이 문서상에 존재하는 모든 input 요소들 중에, name 속성의 값이 message인 요소
    $('input[name=message]').on('keypress', (evt)=>{
      if(evt.keyCode == 13){
        console.log('메시지 전송');
        sendMsg();
      }
    })
    
    // 이 문서상에 존재하는 모든 요소들 중에 id 값이 sendBtn인 요소
    $('#sendBtn').on('click', (evt)=>{
        console.log('메시지 전송');
        sendMsg();
    })
    ;
    // 메시지 전송
    function sendMsg(){
      socket.emit('s_send_msg', $('input[name=message]').val(), new Date() );
      // 입력창 초기화
      $('input[name=message]').val('');
    }
    
    // 메시지를 화면에 추가 처리
    function addMsg(sender, msg, time)
    {
    	
    	
    	console.log(typeof time)
    	time = time.substr(time.indexOf("T")+1,5);
    	console.log(time)
    	// 관리자 메세지는 따로 ~~
      var flag = sender === user_nick ? 'right' : 'left';
      // 1. 메시지UI를 붙일 요소를 찾아서, 동적으로 html을 구성하여 추가한다.
      if(sender === '관리자'){
    	  var html = "<div class='direct-chat-msg' style='margin: auto; width:100%; text-align:center;'>";
    	  html += "<div class='direct-chat-info clearfix'style='display: inline-block'>";
    	  html += "<div class='direct-chat-text' style='position: initial; border:none;'>"+msg+"</div>"
    	  html += "</div>";
    	  html += "</div>";
    	  
      }else if(flag == 'left'){ // 왼쪽 
    	  var html = "<div class='direct-chat-msg "+flag+"'>";
    	  html += "<div class='direct-chat-info clearfix' style='display: inline'>";
    	  html += "<span class='direct-chat-name pull-"+flag+"' stlye='text-align:left!important;'>"+sender+"&nbsp;&nbsp;</span>";
    	  html += "<span class='direct-chat-timestamp pull-right' stlye='text-align:left!important;'>"+time+"</span><br>";
    	  html += "<div class='direct-chat-text' style='text-align:"+flag+"; margin-right: 110px; display: table-cell;'>"+msg+"</div>"
    	  html += "</div>";
    	  html += "</div>";
      }else{  // 오른쪽 
    	  var html = "<div class='direct-chat-msg "+flag+"' style='text-align:right;'>";
    	  html += "<div class='direct-chat-info clearfix' style='display: inline'>";
    	  html += "<span class='direct-chat-timestamp pull-right' stlye='text-align:right!important;' >"+time+"&nbsp;&nbsp;</span>";
    	  html += "<span class='direct-chat-name pull-"+flag+"' stlye='text-align:right!important;' >"+sender+"</span><br>";
    	  html += "<div class='direct-chat-text' style='text-align:"+flag+"; display: table-cell;'>"+msg+"</div>"
    	  html += "</div>";
    	  html += "</div>";
      }
      
      html+= '<div class= row></div>'
      $('.direct-chat-messages').append(html);
      // 자동스크롤
      $('.direct-chat-messages').scrollTop($('.direct-chat-messages')[0].scrollHeight+20);

    }
  
    // 방정보 표시 (rooms가 방들의 정보를 담은 배열이고, myRoom이 내가 들어 있는 배열)
    socket.on('c_send_roomInfo',(rooms, myRoom)=>{
      console.log(rooms, myRoom);
      
      $('#chat_header').empty();
      $.each(rooms,(idx, item)=>{
        console.log(idx, item);
        // 방 정보를 붙이는 대상을 찾아서 html을 구성하여 붙인다
        var html ="<span data-toggle='tooltip' title='' class='badge bg-${ item === myRoom?'red':'yellow' }'>"+item+"</span>";
        $('#chat_header').append(html);
        if(item != myRoom){
          $('#chat_header>span:last').on('click',()=>{
            if(confirm(`${item}방으로 변경하시겠습니까?`)){
              console.log('방 변경시도');
              socket.emit('s_send_roomChg', item);
              // 기존 메시지 삭제
              $('.direct-chat-messages').empty();
            }
          });
        }
      });
    });
});
