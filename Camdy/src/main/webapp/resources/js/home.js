
      
      document.querySelector('.trigger').addEventListener('click', function(){
    	  document.querySelector('.hidden').classList.remove('disappear');
    		document.querySelector('.hidden').classList.add('appear');
    			document.querySelector('.trigger').classList.add('hidden2');
    			document.querySelector('.trigger2').classList.remove('hidden2');
    			
    	});
      
      document.querySelector('.trigger2').addEventListener('click', function(){
    	  document.querySelector('.hidden').classList.remove('appear');
    		document.querySelector('.hidden').classList.add('disappear');
    			document.querySelector('.trigger').classList.remove('hidden2');
    			document.querySelector('.trigger2').classList.add('hidden2');
    			
    	});
    	
    	document.querySelector('.search2').addEventListener('click', function(){
    	  document.querySelector('.index1').classList.remove('hide');
    	});
    	
    	document.querySelector('.exit2').addEventListener('click', function(){
    	  var view = "<p>검색결과가 없습니다.</p>"
    	  document.querySelector('.index1').classList.add('hide');
    	  $("#indexview").html(view);
    	  document.getElementById('index').value=null;
    	  
    	  
			
    	});
    	
    	
    document.querySelector('.newclick').addEventListener('click', function(){
    	  document.querySelector('.new').classList.remove('hide');
    	  document.querySelector('.all').classList.add('hide');
    	  document.querySelector('.lang').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.cer').classList.add('hide');
    	  document.querySelector('.off').classList.add('hide');
    	  document.querySelector('.uni').classList.add('hide');
    	  document.querySelector('.teacher').classList.add('hide');
    	  
    		
		    
    	});
    	
     document.querySelector('.allclick').addEventListener('click', function(){
    	  document.querySelector('.all').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.lang').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.cer').classList.add('hide');
    	  document.querySelector('.off').classList.add('hide');
    	  document.querySelector('.uni').classList.add('hide');
	      document.querySelector('.teacher').classList.add('hide');
	      
    	});
    	
     document.querySelector('.langclick').addEventListener('click', function(){
    	  document.querySelector('.lang').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.all').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.cer').classList.add('hide');
    	  document.querySelector('.off').classList.add('hide');
    	  document.querySelector('.uni').classList.add('hide');
		  document.querySelector('.teacher').classList.add('hide');
		  
    	});
    	
     document.querySelector('.jobclick').addEventListener('click', function(){
    	  document.querySelector('.job').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.all').classList.add('hide');
    	   document.querySelector('.lang').classList.add('hide');
    	   document.querySelector('.cer').classList.add('hide');
    	   document.querySelector('.off').classList.add('hide');
    	   document.querySelector('.uni').classList.add('hide');
		  document.querySelector('.teacher').classList.add('hide');
		  
    	});
    	
     document.querySelector('.cerclick').addEventListener('click', function(){
    	  document.querySelector('.cer').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.all').classList.add('hide');
    	  document.querySelector('.lang').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.off').classList.add('hide');
    	  document.querySelector('.uni').classList.add('hide');
		  document.querySelector('.teacher').classList.add('hide');
		  
    	});
    	
     document.querySelector('.offclick').addEventListener('click', function(){
    	  document.querySelector('.off').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.all').classList.add('hide');
    	  document.querySelector('.lang').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.cer').classList.add('hide');
    	  document.querySelector('.uni').classList.add('hide');
		  document.querySelector('.teacher').classList.add('hide');
		  
    	});
    	
     document.querySelector('.uniclick').addEventListener('click', function(){
    	  document.querySelector('.uni').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
    	  document.querySelector('.all').classList.add('hide');
    	  document.querySelector('.lang').classList.add('hide');
    	  document.querySelector('.job').classList.add('hide');
    	  document.querySelector('.cer').classList.add('hide');
    	  document.querySelector('.off').classList.add('hide');
		  document.querySelector('.teacher').classList.add('hide');
		  
    	});
    
    	
     document.querySelector('.teacherclick').addEventListener('click', function(){
    	  document.querySelector('.teacher').classList.remove('hide');
    	  document.querySelector('.new').classList.add('hide');
          document.querySelector('.all').classList.add('hide');
          document.querySelector('.lang').classList.add('hide');
          document.querySelector('.job').classList.add('hide');
          document.querySelector('.cer').classList.add('hide');
          document.querySelector('.off').classList.add('hide');
          document.querySelector('.uni').classList.add('hide');
		
    	});
    	
    	



    

    	
