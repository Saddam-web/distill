<ui:composition xmlns="http://www.w3.org/1999/xhtml"
	xmlns:f="http://java.sun.com/jsf/core"
	xmlns:ui="http://java.sun.com/jsf/facelets"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:a4j="http://richfaces.org/a4j"
	xmlns:rich="http://richfaces.org/rich">
	<f:view>
		<h:form style="background-color:whitesmoke;">

			<div class="form-group">
				<div class="row">
					<a4j:outputPanel id="msg">
						<div class="row col-md-12 wow shake" style="margin-top: 10px;">
							<h:messages errorStyle="color:red"
								style="font-size: 14px;font-weight: bold"
								styleClass="generalExciseStyle" layout="table"
								infoStyle="color:green" />
						</div>
					</a4j:outputPanel>
				</div>

				<div class="row " align="center">
					<div align="center" width="100%" class="pghead">
						<h2>
							<h:outputText
								value="Old Stock Dispatches From Distillery/Brewery "
								styleClass="generalHeaderOutputTable"
								style="font-weight: bold; font-size: 40px;text-decoration: underline;margin-top: 2px;font-family:Monotype Corsiva;font-size:40px;" />
						</h2>
					</div>
				</div>

				<div class="row " align="center">
					<rich:spacer height="30px"></rich:spacer>
				</div>

				<div class="row col-md-12" align="center"
					style="BACKGROUND-COLOR: #dee0e2;">
					<div class="col-md-12" align="center">
						<h:selectOneRadio style="FONT-WEIGHT: bold;  font-size: 15px; "
							value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radio}"
							valueChangeListener="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radioListener}"
							onchange="this.form.submit();">
							<f:selectItem itemValue="CD" itemLabel="Consolidated" />
							<f:selectItem itemValue="DBW" itemLabel="Distillery / Brewery Wise" />
							<f:selectItem itemValue="SD" itemLabel="Selected Distillery" />
							<f:selectItem itemValue="SB" itemLabel="Selected Brewery" />

						</h:selectOneRadio>
					</div>

				</div>
				<div class="row">
					<rich:spacer height="20px"></rich:spacer>
				</div>

				<div class="col-md-12" align="center">
					<div class="col-md-3" align="right">
						<h:outputText value="Select Distillery Name:"
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radio eq 'SD'}"
							style="FONT-SIZE: small; FONT-WEIGHT: bold;"></h:outputText>
					</div>
					<div class="col-md-3" align="left">
						<h:selectOneMenu
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radio eq 'SD'}"
							value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.distilleryId}"
							style="width: 250px; height: 28px;">
							<f:selectItems
								value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.distilleryList}" />
						</h:selectOneMenu>
					</div>
					<div class="col-md-3" align="right">
						<h:outputText value="Select Brewery Name:"
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radio eq 'SB'}"
							style="FONT-SIZE: small; FONT-WEIGHT: bold;"></h:outputText>
					</div>
					<div class="col-md-3" align="left">
						<h:selectOneMenu
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.radio eq 'SB'}"
							value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.breweryId}"
							style="width: 250px; height: 28px;">
							<f:selectItems
								value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.breweryList}" />
						</h:selectOneMenu>
					</div>

				</div>

				<div class="row">
					<rich:spacer height="20px"></rich:spacer>
				</div>

				<div class="col-md=12" align="center">
					<div class="col-md-3"></div>
					<div class="col-md-1" align="right">From:</div>
					<div class="col-md-2" align="left">
						<rich:calendar
							value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.fromDate}">
						</rich:calendar>
					</div>
					<div class="col-md-1" align="right">To:</div>
					<div class="col-md-2" align="left">
						<rich:calendar
							value="#{dispatchReportDIST_BRE_OLDSTOCK_Action.toDate}">
						</rich:calendar>
					</div>
					<div class="col-md-3"></div>
				</div>

				<div class="row " align="center">
					<rich:spacer height="30px"></rich:spacer>
				</div>
				<br /> <br />
				<div class="row" align="center">
					<h:commandButton value="Print Report" styleClass="btn btn-success"
						action="#{dispatchReportDIST_BRE_OLDSTOCK_Action.print}">
					</h:commandButton>

					<h:outputLink styleClass="outputLinkEx"
						value="/doc/ExciseUp/MIS/pdf/#{dispatchReportDIST_BRE_OLDSTOCK_Action.pdfname}"
						target="_blank">
						<h:outputText styleClass="outputText" id="text223"
							value="View Report"
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.printFlag==true}"
							style="color: blue; font-family: serif; font-size: 12pt"></h:outputText>
					</h:outputLink>

					<rich:spacer width="10px;"></rich:spacer>
					<h:commandButton value="Reset" styleClass="btn btn-warning"
						action="#{dispatchReportDIST_BRE_OLDSTOCK_Action.reset}">
					</h:commandButton>
				</div>
				<br />
				<div class="col-md-12" align="center">
					<h:commandButton
						action="#{dispatchReportDIST_BRE_OLDSTOCK_Action.excel}"
						styleClass="btn btn-primary" value="Generate Excel"
						rendered="true" />

					<h:outputLink styleClass="outputLinkEx"
						value="/doc/ExciseUp//MIS//Excel//#{dispatchReportDIST_BRE_OLDSTOCK_Action.exlname}.xls"
						target="_blank">
						<h:outputText styleClass="outputText" value="Download Excel"
							rendered="#{dispatchReportDIST_BRE_OLDSTOCK_Action.excelFlag==true}"
							style="color: blue; font-family: serif; font-size: 12pt"></h:outputText>
					</h:outputLink>
				</div>

				<div class="row " align="center">
					<rich:spacer height="20px"></rich:spacer>
				</div>
				<br />
			</div>
		</h:form>
	</f:view>
</ui:composition>