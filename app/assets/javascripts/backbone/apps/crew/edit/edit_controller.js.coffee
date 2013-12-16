@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller =

		edit: (crew) ->
			editView = @getEditView crew
			# Replace the main region with the edit view
			App.mainRegion.show editView

		getEditView: (crew) ->
			new Edit.Crew
				model: crew
