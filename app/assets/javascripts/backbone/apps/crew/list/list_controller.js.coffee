@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		list: ->
			listView = @getListView()
			debugger
			App.mainRegion.show listView

		getListView: ->
			new List.Crew