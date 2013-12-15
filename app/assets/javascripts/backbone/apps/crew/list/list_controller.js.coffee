@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		list: ->
			crew = App.request "crew:entities"

			@layout = @getLayoutView()

			@layout.on 'show', =>
				@titleRegion()
				@panelRegion()
				@crewRegion crew

			App.mainRegion.show @layout

		titleRegion: ->
			titleView = @getTitleView()
			@layout.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()
			# Instantiate the new region on button click
			panelView.on "new:crew:button:clicked", =>
				@newRegion()

			@layout.panelRegion.show panelView

		newRegion: ->
			newView = App.request "new:crew:member:view"
			@layout.newRegion.show newView

		crewRegion: (crew) ->
			crewView = @getCrewView crew
			@layout.crewRegion.show crewView

		getCrewView: (crew) ->
			new List.Crew
				collection: crew

		getTitleView: ->
			new List.Title

		getPanelView: ->
			new List.Panel

		getLayoutView: ->
			new List.Layout