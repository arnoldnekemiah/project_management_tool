// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import TimeEntryController from "./time_entry_controller"
import TextareaAutogrowController from "./textarea_autogrow_controller"
import FlashController from "./flash_controller"

application.register("time-entry", TimeEntryController)
application.register("textarea-autogrow", TextareaAutogrowController)
application.register("flash", FlashController)
