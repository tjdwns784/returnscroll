$(document).ready(function() {
	// 채팅에 접속 
    var socket = io("http://192.168.0.95:82");
	
  // 2. 소켓에 이벤트를 등록하여 접속 됬음을 알게 되면 사용자의 이름을 받는다
    // (세션이 있었다면 : 이름, 아이디 사용)
    var user_name ="";

    socket.on('connect', function(){
      user_name = prompt('익명 닉네임 이름');
      console.log('입력한 닉네임 : '+user_name);
      // 서버로 닉네임을 전송 => 서버에 있는 이벤트를 발생시킨다
      socket.emit('s_send_userName', user_name, new Date());
    })
    
    // 서버가 메시지를 보내면 채팅창에 표시
    socket.on('c_send_msg', (sender, msg, time) => {
      console.log(sender, msg, time);
      // 메시지를 화면에 표시
      addMsg(sender, msg, time);
    })
    
    // 현재 대화방 참여자 목록을 표시... 배열을 받음
    socket.on('c_send_member', (member) => {
      console.log("클라이언트에서 방안 멤바:"+ member);
      // 참여자를 화면에 표시
      memberShow(member);
    })
    
    function memberShow(member){
    	var users="<h6>";
    	for(var i=0;i<member.length;i++){
    		users += member[i] + "님  ";
    	}
    	users+="</h6>";
    	console.log('참여자 리스트'+users);	
    	$("#members").append(users);
    }
    
    // 현재 대화방 참여자 목록을 표시... 배열을 받음
    socket.on('c_send_updateMember', (member) => {
      console.log("클라이언트에서 방안 멤바 수정:"+ member);
      // 참여자를 화면에 표시
      memberUpdate(member);
    })
    
    function memberUpdate(member){
    	// 해당 태그 내부요소들을 비움(?)
    	$("#members").empty();
    	var users="<h6>현재 대화 참여자 : ";
    	for(var i=0;i<member.length;i++){
    		users += member[i] + "님  ";
    	}
    	users+="</h6>";
    	console.log('참여자 수정 리스트'+users);	
    	$("#members").append(users);
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
    
    // 메시지 전송
    function sendMsg(){
      socket.emit('s_send_msg', $('input[name=message]').val(), new Date() );
      // 입력창 초기화
      $('input[name=message]').val('');
    }

//  <div class="direct-chat-text">
//	${msg}
//</div>
    
    // 메시지를 화면에 추가 처리
    function addMsg(sender, msg, time)
    {
      var flag = sender === user_name ? 'right' : 'left';
      console.log("지금 이 메세지는 "+flag+"에 위치합니다.")
      // 1. 메시지UI를 붙일 요소를 찾아서, 동적으로 html을 구성하여 추가한다.
      var html = `<div class="direct-chat-msg ${flag}">
                                <div class="direct-chat-info clearfix">
                                    <span class="direct-chat-name pull-${flag}">${sender} : ${msg} </span>

    	  							<p class="direct-chat-timestamp pull-right"> ${time}</p>
                                </div>
                            </div>`;
      $('.direct-chat-messages').append(html);
      // 자동스크롤
      $('.direct-chat-messages').scrollTop($('.direct-chat-messages')[0].scrollHeight+20);

    }
  
    // 방정보 표시
    socket.on('c_send_roomInfo',(rooms, myRoom)=>{
      console.log(rooms, myRoom);
      $('#chat_header').empty();
      $.each(rooms,(idx, item)=>{
        console.log(idx, item);
        // 방 정보를 붙이는 대상을 찾아서 html을 구성하여 붙인다
        var html =`<span data-toggle="tooltip" title="" class="badge bg-${ item === myRoom?'red':'yellow' }">${item}</span>`;
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
