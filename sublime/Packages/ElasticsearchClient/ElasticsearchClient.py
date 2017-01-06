import os
import sys
from imp import reload

package_path = os.path.dirname(__file__)
libpath = os.path.join(package_path, "lib")

if libpath not in sys.path:
    sys.path.append(libpath)


def reload_modeule(module):
    print("reloading plugin {}".format(module))
    reload(sys.modules[module])

module_load_order = [
    "dateutil",
    "requests",
    "six",
    "urllib3",
    "analytics",
    "elasticsearch",
    "elasticsearch_connections",

    "ElasticsearchClient.panel.warmer_list_panel",
    "ElasticsearchClient.panel.switch_server_list_panel",
    "ElasticsearchClient.panel.snapshot_list_panel",
    "ElasticsearchClient.panel.search_template_list_panel",
    "ElasticsearchClient.panel.script_list_panel",
    "ElasticsearchClient.panel.repository_list_panel",
    "ElasticsearchClient.panel.index_template_list_panel",
    "ElasticsearchClient.panel.index_list_panel",
    "ElasticsearchClient.panel.field_list_panel",
    "ElasticsearchClient.panel.doc_type_list_panel",
    "ElasticsearchClient.panel.analyzer_list_panel",
    "ElasticsearchClient.panel.alias_list_panel",
    "ElasticsearchClient.panel",

    "ElasticsearchClient.commands.base",
    "ElasticsearchClient.commands.bulk",
    "ElasticsearchClient.commands.cat_aliases",
    "ElasticsearchClient.commands.cat_allocation",
    "ElasticsearchClient.commands.cat_count",
    "ElasticsearchClient.commands.cat_fielddata",
    "ElasticsearchClient.commands.cat_health",
    "ElasticsearchClient.commands.cat_indices",
    "ElasticsearchClient.commands.cat_master",
    "ElasticsearchClient.commands.cat_nodes",
    "ElasticsearchClient.commands.cat_pending_tasks",
    "ElasticsearchClient.commands.cat_plugins",
    "ElasticsearchClient.commands.cat_recovery",
    "ElasticsearchClient.commands.cat_segments",
    "ElasticsearchClient.commands.cat_shards",
    "ElasticsearchClient.commands.cat_thread_pool",
    "ElasticsearchClient.commands.clear_scroll",
    "ElasticsearchClient.commands.cluster_get_settings",
    "ElasticsearchClient.commands.cluster_health",
    "ElasticsearchClient.commands.cluster_pending_tasks",
    "ElasticsearchClient.commands.cluster_put_settings",
    "ElasticsearchClient.commands.cluster_reroute",
    "ElasticsearchClient.commands.cluster_state",
    "ElasticsearchClient.commands.cluster_stats",
    "ElasticsearchClient.commands.count",
    "ElasticsearchClient.commands.count_percolate",
    "ElasticsearchClient.commands.create_document",
    "ElasticsearchClient.commands.delete_by_query",
    "ElasticsearchClient.commands.delete_document",
    "ElasticsearchClient.commands.delete_script",
    "ElasticsearchClient.commands.delete_search_template",
    "ElasticsearchClient.commands.exists_document",
    "ElasticsearchClient.commands.explain_document",
    "ElasticsearchClient.commands.field_stats",
    "ElasticsearchClient.commands.get_document",
    "ElasticsearchClient.commands.get_document_source",
    "ElasticsearchClient.commands.get_multiple_documents",
    "ElasticsearchClient.commands.get_percolator_query",
    "ElasticsearchClient.commands.get_script",
    "ElasticsearchClient.commands.get_search_template",
    "ElasticsearchClient.commands.helper_benchmark",
    "ElasticsearchClient.commands.helper_change_number_of_replicas",
    "ElasticsearchClient.commands.helper_close_open_index",
    "ElasticsearchClient.commands.helper_convert_csv_bulk_index",
    "ElasticsearchClient.commands.helper_dump_index_data",
    "ElasticsearchClient.commands.helper_import_csv",
    "ElasticsearchClient.commands.helper_load_index_data",
    "ElasticsearchClient.commands.helper_reindex",
    "ElasticsearchClient.commands.index_document",
    "ElasticsearchClient.commands.index_percolator_query",
    "ElasticsearchClient.commands.indices_analyze",
    "ElasticsearchClient.commands.indices_clear_cache",
    "ElasticsearchClient.commands.indices_close",
    "ElasticsearchClient.commands.indices_create",
    "ElasticsearchClient.commands.indices_create_doc_type",
    "ElasticsearchClient.commands.indices_delete",
    "ElasticsearchClient.commands.indices_delete_alias",
    "ElasticsearchClient.commands.indices_delete_mapping",
    "ElasticsearchClient.commands.indices_delete_template",
    "ElasticsearchClient.commands.indices_delete_warmer",
    "ElasticsearchClient.commands.indices_exists",
    "ElasticsearchClient.commands.indices_exists_alias",
    "ElasticsearchClient.commands.indices_exists_doc_type",
    "ElasticsearchClient.commands.indices_exists_template",
    "ElasticsearchClient.commands.indices_flush",
    "ElasticsearchClient.commands.indices_flush_synced",
    "ElasticsearchClient.commands.indices_get",
    "ElasticsearchClient.commands.indices_get_alias",
    "ElasticsearchClient.commands.indices_get_field_mapping",
    "ElasticsearchClient.commands.indices_get_mapping",
    "ElasticsearchClient.commands.indices_get_settings",
    "ElasticsearchClient.commands.indices_get_template",
    "ElasticsearchClient.commands.indices_get_upgrade",
    "ElasticsearchClient.commands.indices_get_warmer",
    "ElasticsearchClient.commands.indices_open",
    "ElasticsearchClient.commands.indices_optimize",
    "ElasticsearchClient.commands.indices_put_alias",
    "ElasticsearchClient.commands.indices_put_mapping",
    "ElasticsearchClient.commands.indices_put_settings",
    "ElasticsearchClient.commands.indices_put_template",
    "ElasticsearchClient.commands.indices_put_warmer",
    "ElasticsearchClient.commands.indices_recovery",
    "ElasticsearchClient.commands.indices_refresh",
    "ElasticsearchClient.commands.indices_segments",
    "ElasticsearchClient.commands.indices_stats",
    "ElasticsearchClient.commands.indices_status",
    "ElasticsearchClient.commands.indices_update_aliases",
    "ElasticsearchClient.commands.indices_upgrade",
    "ElasticsearchClient.commands.indices_validate_query",
    "ElasticsearchClient.commands.info",
    "ElasticsearchClient.commands.multiple_percolate",
    "ElasticsearchClient.commands.multiple_search",
    "ElasticsearchClient.commands.multiple_termvectors",
    "ElasticsearchClient.commands.nodes_hot_threads",
    "ElasticsearchClient.commands.nodes_info",
    "ElasticsearchClient.commands.nodes_shutdown",
    "ElasticsearchClient.commands.percolate",
    "ElasticsearchClient.commands.ping",
    "ElasticsearchClient.commands.put_script",
    "ElasticsearchClient.commands.put_search_template",
    "ElasticsearchClient.commands.scroll",
    "ElasticsearchClient.commands.search_exists",
    "ElasticsearchClient.commands.search_percolator_query",
    "ElasticsearchClient.commands.search_request_body",
    "ElasticsearchClient.commands.search_shards",
    "ElasticsearchClient.commands.search_simple_query",
    "ElasticsearchClient.commands.search_template",
    "ElasticsearchClient.commands.settings_select_doc_type",
    "ElasticsearchClient.commands.settings_select_index",
    "ElasticsearchClient.commands.settings_show_active_server",
    "ElasticsearchClient.commands.settings_switch_server",
    "ElasticsearchClient.commands.show_output_panel",
    "ElasticsearchClient.commands.show_response",
    "ElasticsearchClient.commands.snapshot_create",
    "ElasticsearchClient.commands.snapshot_create_repository",
    "ElasticsearchClient.commands.snapshot_delete",
    "ElasticsearchClient.commands.snapshot_delete_repository",
    "ElasticsearchClient.commands.snapshot_get",
    "ElasticsearchClient.commands.snapshot_get_repository",
    "ElasticsearchClient.commands.snapshot_restore",
    "ElasticsearchClient.commands.snapshot_status",
    "ElasticsearchClient.commands.snapshot_verify_repository",
    "ElasticsearchClient.commands.suggest",
    "ElasticsearchClient.commands.termvector",
    "ElasticsearchClient.commands.update_document",
    "ElasticsearchClient.commands",
]

for module in module_load_order:
    if module in sys.modules:
        reload_modeule(module)


from .commands import *
