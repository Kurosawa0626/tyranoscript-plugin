[macro name="QuakeKrswStart"]
[iscript]
tf.is_skip = TG.stat.is_skip;
if(tf.is_skip != true) {
	var count = 0;
	var interval = mp.interval ? mp.interval : 32;
	var signed = 1;
	var per = 1.0;
	var finish = false;
	var layer = null;
	tf.init_top = null;
	if(mp.name) {
		layer = $("."+mp.name);
		if(layer.css("top") == "auto") {
			tf.init_top = parseInt(layer.parent().height()-layer.height());
		} else {
			tf.init_top = parseInt(layer.css("top").slice(0,-2));
		}
	} else if(mp.layer) {
		layer = $("."+mp.layer+"_fore, ."+mp.layer+"_back");
		tf.init_top = 0;
	} else {
		layer = $("#root_layer_game").children();
		tf.init_top = 0;
	}
	tf.init_left = parseInt(layer.css("left").slice(0,-2));
	if(tf.init_left !== tf.init_left){ tf.init_left = 0; }

	var QuakeKrswStart = function ()
	{
		if(count * interval < mp.time || mp.infinity)
		{
			if(mp.wait && !mp.infinity) { 
				$(".layer_event_click").css("display", "none"); 
			}

			if(mp.accel && !mp.infinity)
			{
				var past = count * interval;
				per = calcPerAccel(past/mp.time, mp.accel);
				per = mp.accel >= 2 ? per : 1.0 - per;
				if(past>mp.time)
				{
					per = Number(mp.accel >= 2);
					mp.accel = false;
				}
			}

			var top  = (mp.infinity ? signed * mp.hmax : parseInt(signed * per * mp.hmax, 10))+tf.init_top;
			var left = (mp.infinity ? signed * mp.wmax : parseInt(signed * per * mp.wmax, 10))+tf.init_left;
			layer.animate(
				{ "top": top + "px", "left": left + "px" },
				{ duration: interval, easing: 'linear', complete: QuakeKrswStart }
			);

			signed *= -1;
			count++;
		}
		else
		{
			if(!finish)
			{
				finish = true;
				layer.animate({ "top": tf.init_top + "px", "left": tf.init_left + "px" }, {
					duration: 0, easing: 'linear', complete: function(){
						if(mp.wait){ $(".layer_event_click").css("display", "block"); }
					}
				});
			}
		}
	};
	function calcPerAccel(per, accel)
	{
		if(accel <= -2)
		{
			return 1.0 - Math.pow(1.0-per, -accel).toFixed(5);
		}
		else if(accel >= 2)
		{
			return Math.pow(per, accel).toFixed(5);
		}

		return per.toFixed(5);
	}

	QuakeKrswStart();
}
[endscript]
[endmacro]
;--------------------------------------------------------------------
[macro name="QuakeKrswFinish"]
[iscript]
tf.is_skip = TG.stat.is_skip;
if(tf.is_skip != true) {
	var layer = mp.name ? $("."+mp.name) 
	                    : (mp.layer ? layer = $("."+mp.layer+"_fore, ."+mp.layer+"_back") 
	                                : $("#root_layer_game").children());
	layer.stop(true);
	layer.animate({ "top": tf.init_top + "px", "left": tf.init_left + "px" }, {duration: 0});
}
[endscript]
[endmacro]
