<div class="crm-block crm-content-block crm-contact-page crm-inline-edit-container">
    <div id="mainTabContainer" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
      <ul class="crm-contact-tabs-list ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
        <li id="tab_summary" class="crm-tab-button ui-corner-all ui-state-default ui-corner-top ui-tabs-active ui-state-active">
          <a href="#personal-campaign" title="{ts}Summary{/ts}">
            <span> </span> {ts}Personal Campaign{/ts}
            <em></em>
          </a>
        </li>
      </ul>



		<div id="personal-campaign" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
		<table id="options" class="display">
		  <thead>
		    <tr>
		    <th>{ts}Page Title{/ts}</th>
		    <th>{ts}Contribution Page / Event{/ts}</th>
		    <th>{ts}No of Contributions{/ts}</th>
		    <th>{ts}Amount Raised{/ts}</th>
		    <th>{ts}Goal Amount{/ts}</th>
		    <th>{ts}Status{/ts}</th>
		    <th></th>
		    </tr>
		  </thead>
		  <tbody>
		  {foreach from=$rows item=row}
		  <tr id="row_{$row.id}" class="{$row.class}">
		    <td><a href="{crmURL p='civicrm/pcp/info' q="reset=1&id=`$row.pcpId`" fe='true'}" title="{ts}View Personal Campaign Page{/ts}" target="_blank">{$row.pcpTitle}</a></td>
		    <td><a href="{$row.page_url}" title="{ts}View page{/ts}" target="_blank">{$row.pageTitle}</a></td>
		    <td>{$row.honor}</td>
		    <td>{$row.total|crmMoney}</td>
		    <td>{$row.goal_amount|crmMoney}</td>
		    <td>{$row.pcpStatus}</td>
		    <td><a href="{crmURL p='civicrm/pcp/info' q="action=update&reset=1&id=`$row.pcpId`&component=`$row.page_type`" fe='true'}">edit</a></td>
		    <!--<td id={$row.id}>{$row.action|replace:'xx':$row.id}</td>-->
		  </tr>
		  {/foreach}
		  </tbody>
		</table>

		</div>
		<div class="clear"></div>
</div>
<div class="clear"></div>
</div>

