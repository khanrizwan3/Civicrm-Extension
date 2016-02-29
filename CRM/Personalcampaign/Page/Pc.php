<?php

require_once 'CRM/Core/Page.php';
require_once 'CRM/PCP/BAO/PCP.php';
require_once 'CRM/Core/DAO.php';


class CRM_Personalcampaign_Page_Pc extends CRM_Core_Page {
  public function run() {
    // Example: Set the page-title dynamically; alternatively, declare a static title in xml/Menu/*.xml
    CRM_Utils_System::setTitle(ts('Pc'));


	$contact_id = '';
	if(isset($_SESSION['CiviCRM']['userID'])){
		$contact_id = (int) $_SESSION['CiviCRM']['userID'];
	}

    $pcp = new CRM_PCP_BAO_PCP();
    list($col,$rows) = $pcp->getPcpDashboardInfo($contact_id);
 
    foreach ($rows as $key => $value) {
    	# code...
    	$id = (int) $value['pcpId'];
    	$prms = array('id' => $id);
	    CRM_Core_DAO::commonRetrieve('CRM_PCP_DAO_PCP', $prms, $pcpInfo);
	    ///debug($pcpInfo);
	    $totalAmount = CRM_PCP_BAO_PCP::thermoMeter($id);

	    $rows[$key]['goal_amount'] = $pcpInfo['goal_amount'];
	    $rows[$key]['page_type'] = $pcpInfo['page_type'];
	    $rows[$key]['total'] = $totalAmount ? $totalAmount : '0.0';
	    $honor = CRM_PCP_BAO_PCP::honorRoll($id);
	    $rows[$key]['honor'] = count($honor);
    }

    $this->assign('rows',$rows);

    // Example: Assign a variable for use in a template
    $this->assign('currentTime', date('Y-m-d H:i:s'));

    parent::run();
  }
}
