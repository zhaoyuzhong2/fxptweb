/**
 * Created by Administrator on 2018/12/22.
 */
/* c-searchbar js */
$('.clear-btn').on('click',function(){
    var searchIpt = $(this).closest('.c-searchbar').find('.search-ipt');
    searchIpt.val("");
    $(this).hide();
});
$(".c-searchbar .search-ipt").keydown(function(){
    if($(this).val() != ""){
        $(this).closest('.c-searchbar').find('.clear-btn').show();
    }else {
        $(this).closest('.c-searchbar').find('.clear-btn').hide();
    }
});
$(".c-searchbar .input-wrap").on('click',function(event){
    event.stopPropagation();
    $(this).closest('.c-searchbar').addClass('focus');
    $(this).find('.search-ipt').focus();
});
$(document).on('click',function(event){
    if($('.c-searchbar .search-ipt').val() == ""){
        $('.c-searchbar').removeClass('focus');
    }
});
$('.c-searchbar .changelist-btn').on('click',function(){
    if($(this).hasClass('icon-xq-')) {
        $(this).removeClass('icon-xq-');
        $(this).addClass('icon-jichu-');
    }else {
        $(this).removeClass('icon-jichu-');
        $(this).addClass('icon-xq-');
    }
});