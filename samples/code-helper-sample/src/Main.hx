package;
import eskimo.BufferView;
import eskimo.Context;
import eskimo.Entity;
import eskimo.EventView;
import eskimo.View;
import eskimo.utils.SystemHelper;
import haxe.Json;
import Components;

/**
 * ...
 * @author PDeveloper
 */

using Lambda;
using EntityHelper;

class Main 
{
	
	static function main():Void
	{
		var context = new Context();
		
		var creator = new SystemHelper(context);
		
		var e0 = context.create();
		var e1 = context.create();
		
		e0.addA('entity 0').addB(3);
		e1.addA('entity 1').addC( {
			prop: 'Hello'
		});
		
		creator.added(function (e) {
			var ca = e.get(ComponentA);
			trace(ca.string);
		}, [ComponentA]);
		
		creator.added(function (e) {
			var ca = e.get(ComponentA);
			var cb = e.get(ComponentB);
			
			var string = '';
			for (i in 0...cb.int) string += ca.string;
			trace(string);
		}, [ComponentA, ComponentB]);
		
		creator.entities(function (e) {
			trace(e.flag);
		}, []);
	}
	
}