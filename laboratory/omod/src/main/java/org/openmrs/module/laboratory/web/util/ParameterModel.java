/**
 *  Copyright 2011 Society for Health Information Systems Programmes, India (HISP India)
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
 **/

package org.openmrs.module.laboratory.web.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class ParameterModel implements Comparable<ParameterModel> {
	private String id;
	private String type;
	private String title;
	private List<String> optionValues = new ArrayList<String>();
	private List<String> optionLabels = new ArrayList<String>();
	private String unit;
	private String validator;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<String> getOptionValues() {
		return optionValues;
	}

	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}

	public List<String> getOptionLabels() {
		return optionLabels;
	}

	public void setOptionLabels(List<String> optionLabels) {
		this.optionLabels = optionLabels;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getValidator() {
		return validator;
	}

	public void setValidator(String validator) {
		this.validator = validator;
	}

	public int compareTo(ParameterModel o) {
		if (StringUtils.isBlank(o.getId()))
			return 1;
		if (StringUtils.isBlank(this.getId()))
			return -1;
		String thisId = id;
		String oId = o.getId();
		return thisId.compareToIgnoreCase(oId);
	}

	public String toString() {
		return "ParameterModel [id=" + id + "]";
	}
}
