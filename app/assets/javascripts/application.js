// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery-ui
//= require filterrific/filterrific-jquery
//= require cocoon
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require jquery.mask
//= require_tree .

jQuery.railsAutocomplete.options.noMatchesLabel = 'Nada encontrado, preencha os campos para que o que você procura seja automaticamente registrado no nosso banco de dados'

function fields() {
  let fields = $('.nested-fields').last();
  let name = fields.children().first().children().last();
  let number = name.attr('id');

  number = number.replace('occurrency_occurrency_students_attributes_', '').replace('_name', '');
  name.attr('data-update-elements', '{"classy":"#occurrency_occurrency_students_attributes_' + number + '_classy","groupy":"#occurrency_occurrency_students_attributes_' + number + '_groupy","id":"#occurrency_occurrency_students_attributes_' + number + '_student_id"}');
}

function guestsFields() {
  let fields = $('#guests > .nested-fields').last();
  let name = fields.children().first().children().first().children().last();
  let number = name.attr('id');

  number = number.replace('appointment_appointment_guests_attributes_', '').replace('_name', '');
  name.attr('data-update-elements', '{"description":"#appointment_appointment_guests_attributes_' + number + '_description","school_id":"#appointment_appointment_guests_attributes_' + number + '_school_id"}');
}

function appointmentStudentsFields() {
  let fields = $('#students > .nested-fields').last();
  let name = fields.children().first().children().first().children().last();
  let number = name.attr('id');

  number = number.replace('appointment_appointment_students_attributes_', '').replace('_name', '');
  name.attr('data-update-elements', '{"id":"#appointment_appointment_students_attributes_' + number + '_student_id","classy":"#appointment_appointment_students_attributes_' + number + '_classy","groupy":"#appointment_appointment_students_attributes_' + number + '_groupy"}');
}

$(document).ready(function(){
  $(".date").mask("00/00/0000");
});

window.mobilecheck = function() {
  var check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
};

function updateLink() {
  $('#next-button').attr('href', '/relatories/print_appointments/' + String(selected).replace(/,/g, '%2F'));
}

function sendAppointment(id) {
  $('#' + id).appendTo('#selected');
  $('#' + id).children('.add-button').remove();
  $('#' + id).attr('id', 'selected_' + id);
}

function updateList(list, id) {
  if (list.length == 0) {
    list[0] = $('#' + id).closest('tr').attr('id');
    $('#start')[0].style.display = "none";
    $('#next-button')[0].style.display = "unset";
  } else {
    list[selected.length] = $('#' + id).closest('tr').attr('id');
  }

  return list;
}

function toggleSideBar() {
  if ($('.sidebar').hasClass("sidebar--active")) {
    $('.sidebar').removeClass('sidebar--active');
  } else {
    $('.sidebar').addClass('sidebar--active');
  }

  $('.sidebar__content').toggle();
}

function turnToPage() {
  $("#flipbook").turn("page", $('#pageToTurn')[0].value);
  $('#pageToTurn')[0].value = "";
  toggleSideBar();
}

function setAppointment(element) {
  element.addClass('appointment-title--selected');

  element.removeClass('appointment-title--3');
  element.removeClass('appointment-title--2');
  element.removeClass('appointment-title--1');

  element.addClass('appointment-title--2');

  $('#appointment_kind').attr('value', element.attr('id'));
  $('#main-title').fadeOut();

  $('.appointment-title').each(function() { if ($(this).attr('id') != element.attr('id')) { $(this).fadeOut(); } });

  setTimeout(function() { element[0].style.top = "0"; }, 1200);
  setTimeout(function() {
    $('.appointment-form').fadeIn();
    $('.' + element.attr('id')).fadeIn();
  }, 1400);
}

function checkInputs() {
  var check = true;

  $('select, textarea, input.input').each(function(){
    if (!$(this).val()) { check = false }
  });

  if (check == true) {
    $('#submit').removeAttr('disabled');
  } else {
    $('#submit').attr('disabled', 'disabled');
  }
}
