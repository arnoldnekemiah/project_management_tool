// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import TimeEntryController from "./time_entry_controller"
application.register("time-entry", TimeEntryController)

import TextareaAutogrowController from "./textarea_autogrow_controller"
application.register("textarea-autogrow", TextareaAutogrowController)
