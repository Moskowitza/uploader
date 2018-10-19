{include file='top-header.tpl'}



<!--Start for uploadify-->



<script type="text/javascript" src="{$main_path}uploadify/uploadify_new/jquery-1.7.2.min.js"></script>



<script type="text/javascript" src="{$main_path}uploadify/uploadify_new/jquery.uploadify.js"></script>

{literal}

    <script>

        $(document).ready(function() {

            $('#checkAllWatermarks').click(function(event) {  //on click

                if(this.checked) { // check select status

                    $('.watermark_checkbox').each(function() { //loop through each checkbox

                        this.checked = true;  //select all checkboxes with class "checkbox1"

                    });

                }else{

                    $('.watermark_checkbox').each(function() { //loop through each checkbox

                        this.checked = false; //deselect all checkboxes with class "checkbox1"

                    });

                }

            });



            $('#delete').click(function() {

                return confirm('Are you sure you want to delete the selected images?');

            });



        });

    </script>

{/literal}



<link href="{$main_path}uploadify/uploadify_new/uploadify.css" rel="stylesheet" type="text/css" />



<!--End for uploadify-->



</head>



<body>



<div id="main_container"> {include file='header.tpl'}



  <div class="main_content"> {include file='menu.tpl'}



    <div class="center_content"> {include file='left-bar.tpl'}



      <div class="right_content">



        <h2>ADD NEW PHOTOS</h2>



        <div class="form">



          <form name="frm_photo_upload" id="frm_photo_upload" action="" method="post" enctype="multipart/form-data">



            <input type="hidden" name="submitted" id="submitted" value="">



            <input type="hidden" name="user_id" value="{$smarty.request.user_id}"/>



            <dt>Upload</dt>



            <br clear="all"/>



            <div align="center" >



              <div id="fileQueue"></div>



              <br/>



              <input type="file" name="uploadify" id="uploadify" />



              <p> <a href="javascript:jQuery('#uploadify').uploadify('upload', '*');"><b>Upload and Publish Photos</b></a>&nbsp;|&nbsp;<a href="javascript:jQuery('#uploadify').uploadify('cancel', '*');"><b>Cancel All Uploads</b></a></p>
			  <p> <a href="javascript:jQuery('#uploadify').uploadify({ 'upload' : '*' });"><b>Upload and Publish Photos</b></a>&nbsp;|&nbsp;<a href="javascript:jQuery('#uploadify').uploadify('cancel', '*');"><b>Cancel All Uploads</b></a></p>



            </div>



          </form>



        </div>



        



        <div align="center" style="float:left;">



        <form name="frm_photo" id="frm_photo" action="" method="post" >



        <input type="hidden" name="user_id" id="user_id" value="{$smarty.request.user_id}">

<table width="100%" border="1" cellspacing="2" cellpadding="2">



    <thead>



    	<tr>



	    <th scope="col" class="rounded-company"><input type="submit" name="delete" id="delete" value="Delete"><input type="submit" name="coverphoto" id="coverphoto" value="Update"></th>

            <th scope="col" class="rounded">Photo</th>

            <th scope="col" class="rounded">Delete</th>

            <th scope="col" class="rounded">Cover</th>

            <th scope="col" class="rounded">

                Watermark<br />

                <input type="checkbox" name="checkallwatermarks" id="checkAllWatermarks" />

            </th>

	    <th scope="col" class="rounded">Display Order</th>

        </tr>



    </thead>



        <tfoot>



    	<tr>



        	<td colspan="3"><em></em></td>



        </tr>



    </tfoot>



    <tbody>



    {if $show_photos neq NULL}



       {foreach from=$show_photos item="photosall" name=photonm}



        <tr>



        	<td><input type="checkbox" name="checkdelete[]" id="checkdelete" value="{$photosall.id}" /></td>



            <td><img src="/img/phpThumb/phpThumb.php?src=/uploaded_images/{$photosall.image|replace:' ':''}&w=100" alt=""   /></td>



            <td><a href="add_photos.php?act=1&del_id={$photosall.id}&user_id={$photosall.member_id}" class="ask"><img src="{$a_path}images/trash.png" alt="" title="" border="0" /></a></td>

	    <td><input type="checkbox" name="cover[]" id="cover" value="{$photosall.id}" {if $photosall.cover_photo eq 'Y'}checked{/if}/></td>

	    <td><input type="checkbox" name="watermark[]" class="watermark_checkbox" value="{$photosall.id}" /></td>

           <td><input type="text" name="order[{$photosall.id}]" id="order" style="width: 100px;" value="{$photosall.order}"/></td>



        </tr>



        {/foreach}



     {else}



        <tr>



            <td colspan="3"><em>No photos are available.</em></td>



        </tr>



     {/if}



    </tbody>



</table>



</form>



        </div>



</div>



      <!-- end of right content--> 



      



    </div>



    <!--end of center content -->



    



    <div class="clear"></div>



  </div>



  <!--end of main content--> 



  



  {include file='footer.tpl'} </div>



</body>



</html>{literal}



<script type="text/javascript">



	jQuery.noConflict(); 



	jQuery(document).ready(function() {



        jQuery("#uploadify").uploadify({



			'swf'       : '{/literal}{$main_path}{literal}uploadify/uploadify_new/uploadify.swf',

			'uploader'         : '{/literal}{$main_path}{literal}uploadify/uploadify_new/uploadify.php?user_id={/literal}{$smarty.request.user_id}{literal}',
			'uploadFolder':'{/literal}{$main_path}{literal}uploaded_images',

			'queueID'        : 'fileQueue',

			'auto'           : true,



			'multi'          : true,

            'uploadLimit' : 25,

			'onQueueComplete'  : function(event, data) {







									document.frm_photo_upload.submitted.value="Upload Photo";



									document.frm_photo_upload.submit();



								}



		});



	});		



</script>



{/literal}

