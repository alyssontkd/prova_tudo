<?php

namespace AlternativaQuestao;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

class Module {

    /**
     * 
     */
    public function onBootstrap(MvcEvent $e) {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }

    /**
     * 
     */
    public function getConfig() {
        return include __DIR__ . '/config/module.config.php';
    }

    /**
     * 
     */
    public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    /**
     * 
     * @return array
     */
    public function getServiceConfig() {
        return array(
            'factories' => array(
                'AlternativaQuestao\Service\AlternativaQuestaoService' => function($sm) {

                    return new \AlternativaQuestao\Service\AlternativaQuestaoService();
                },
            )
        );
    }

    /**
     * 
     * @return type
     */
    public function getViewHelperConfig() {
        return array(
            'factories' => array(
                'listarAlternativas' => function() {
                    $AlternativaQuestaoService = new \AlternativaQuestao\Service\AlternativaQuestaoService();

                    return new \AlternativaQuestao\View\Helper\ListarAlternativas($AlternativaQuestaoService);
                }
            ),
        );
    }

}