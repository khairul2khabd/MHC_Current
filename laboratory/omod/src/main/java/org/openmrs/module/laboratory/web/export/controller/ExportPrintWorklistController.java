/**
 *  Copyright 2012 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Laboratory module.
 *
 *  Laboratory module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * author Ghanshyam
 * 24-sept-2012
 * New Requirement #361 [Laboratory] Export to Excel option in print worklist
 **/

package org.openmrs.module.laboratory.web.export.controller;

import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.openmrs.module.laboratory.web.export.DownloadService;
import org.openmrs.module.laboratory.web.export.ExportAttributeDetailsApi;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller("LaboratoryExportWorkListController")
@SessionAttributes("adts")
public class ExportPrintWorklistController {
	@SuppressWarnings("restriction")
	@Resource(name = "downloadService")
	private DownloadService downloadService;

	@RequestMapping(value = "/module/laboratory/download.form", method = RequestMethod.GET)
	public void excelExport(
			@RequestParam(value = "date", required = false) String dateStr,
			@RequestParam(value = "phrase", required = false) String phrase,
			@RequestParam(value = "investigation", required = false) Integer investigationId,
			@RequestParam(value = "showResults", required = false) String showResults,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws ClassNotFoundException, ParseException {
		ExportAttributeDetailsApi adts = new ExportAttributeDetailsApi();
		adts.setDateStr(dateStr);
		adts.setPhrase(phrase);
		adts.setInvestigationId(investigationId);
		adts.setShowResults(showResults);
		model.addAttribute(adts);

		// Delegate to downloadService.
		downloadService.downloadXLS(adts, request, response);
	}
}