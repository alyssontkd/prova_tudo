<?php

namespace Temporizacao\Controller;

use Estrutura\Controller\AbstractCrudController;
use Zend\View\Model\JsonModel;
use Estrutura\Helpers\Cript;
use Zend\View\Model\ViewModel;

class TemporizacaoController extends AbstractCrudController
{
    /**
     * @var \Prova\Service\Prova
     */
    protected $service;

    /**
     * @var \Prova\Form\Prova
     */
    protected $form;

    public function __construct()
    {
        parent::init();
    }

    public function indexAction()
    {
        //return parent::index($this->service, $this->form);
        return new ViewModel([
            'service' => $this->service,
            'form' => $this->form,
            'controller' => $this->params('controller'),
            'atributos' => array()
        ]);
    }

    public function indexPaginationAction()
    {
        //http://igorrocha.com.br/tutorial-zf2-parte-9-paginacao-busca-e-listagem/4/

        $filter = $this->getFilterPage();

        $camposFilter = [
            '0' => [
                'filter' => "temporizacao.nm_temporizacao LIKE ?",
            ],

            '2' => NULL,

        ];


        $paginator = $this->service->getTemporizacaoPaginator($filter, $camposFilter);

        $paginator->setItemCountPerPage($paginator->getTotalItemCount());

        $countPerPage = $this->getCountPerPage(
            current(\Estrutura\Helpers\Pagination::getCountPerPage($paginator->getTotalItemCount()))
        );

        $paginator->setItemCountPerPage($this->getCountPerPage(
            current(\Estrutura\Helpers\Pagination::getCountPerPage($paginator->getTotalItemCount()))
        ))->setCurrentPageNumber($this->getCurrentPage());

        $viewModel = new ViewModel([
            'service' => $this->service,
            'form' => $this->form,
            'paginator' => $paginator,
            'filter' => $filter,
            'countPerPage' => $countPerPage,
            'camposFilter' => $camposFilter,
            'controller' => $this->params('controller'),
            'atributos' => array()
        ]);

        return $viewModel->setTerminal(TRUE);
    }

    /*public function gravarAction() {
            try {
                $controller = $this->params('controller');
                $request = $this->getRequest();
                $service = $this->service;
                $form = $this->form;

                if (!$request->isPost()) {
                    throw new \Exception('Dados Inválidos');
                }

                $post = \Estrutura\Helpers\Utilities::arrayMapArray('trim', $request->getPost()->toArray());

                $files = $request->getFiles();
                $upload = $this->uploadFile($files);

                $post = array_merge($post, $upload);

                if (isset($post['id']) && $post['id']) {
                    $post['id'] = Cript::dec($post['id']);
                }


                $cidade = new \Cidade\Service\CidadeService();
                $arrCidade = $cidade->getIdCidadePorNomeToArray($post['id_cidade']);
                $post['id_cidade'] = $arrCidade['id_cidade'];

                $form->setData($post);

                if (!$form->isValid()) {
                    $this->addValidateMessages($form);
                    $this->setPost($post);
                    $this->redirect()->toRoute('navegacao', array('controller' => $controller, 'action' => 'cadastro'));
                    return false;
                }

                $service->exchangeArray($form->getData());
                $this->addSuccessMessage('Registro Alterado com sucesso');
                $this->redirect()->toRoute('navegacao', array('controller' => $controller, 'action' => 'index'));
                return $service->salvar();

            } catch (\Exception $e) {

                $this->setPost($post);
                $this->addErrorMessage($e->getMessage());
                $this->redirect()->toRoute('navegacao', array('controller' => $controller, 'action' => 'cadastro'));
                return false;
            }

        }




        public function cadastroAction()
        {
            return parent::cadastro($this->service, $this->form);
        }

        public function excluirAction()
        {
            return parent::excluir($this->service, $this->form);
        }
    }*/
    public function gravarAction()
    {
        #Alysson
        $controller = $this->params('controller');
        $this->addSuccessMessage('Registro salvo com sucesso');
        $this->redirect()->toRoute('navegacao', array('controller' => $controller, 'action' => 'index'));
        return parent::gravar($this->service, $this->form);
    }

    public function cadastroAction()
    {
        return parent::cadastro($this->service, $this->form);
    }

    public function excluirAction()
    {
        return parent::excluir($this->service, $this->form);
    }

    public function obterTemporizacaoAction()
    {

        $params = $this->getRequest()->getPost()->toArray();

        $form = new \Temporizacao\Form\TemporizacaoForm(['params' => $params]);

        $dadosView = [
            'form' => $form,
            'controller' => $this->params('controller'),
        ];

        $view = new ViewModel($dadosView);
        return $view->setTerminal(true);
    }

    public function excluirLogAction(){

        $auth = $this->getServiceLocator()->get('AuthService')->getStorage()->read();
        $controller = $this->params('controller');
        $id_temporizacao = $this->params('id');

        if (isset($id_temporizacao) && $id_temporizacao) {
            $id_temporizacao = \Estrutura\Helpers\Cript::dec($id_temporizacao);
        } else {
            $this->addErrorMessage('ID não informado');
            return $this->redirect()->toRoute('navegacao', ['controller' => $controller, 'action' => 'index']);
        }
        $temporizacaoService = new \Temporizacao\Service\TemporizacaoService();
        $temporizacaoEntity = $temporizacaoService->buscar($id_temporizacao);

        if (1 == $auth->id_perfil) { //Se o usuario logado for Administrador
            $temporizacaoEntity->setCsAtivo(0); // Valor '0' desabilita o campo cs_ativo
            $temporizacaoEntity->salvar();
        }
        $this->addSuccessMessage('Temporização excluida com sucesso.');
        return $this->redirect()->toRoute('navegacao', array('controller' => $controller, 'action' => 'index'));
    }

}

