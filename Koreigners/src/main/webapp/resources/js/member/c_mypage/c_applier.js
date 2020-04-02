var mem_id="";
var hire_idx=0;
var chkSelectAppend=0;
$( function() {
	mem_id=$('#mem_id').val();
	getData(2,mem_id,1);
	
	
	$("#hireSelect").change(function(){
		hire_idx= $("#hireSelect  option:selected").val();
		getData(2,mem_id,1);
	 });
	
});