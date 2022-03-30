<template>
  <b-container fluid>
    <b-row>
      <b-col cols="12">
        <b-card
            header="Problēmas"
            header-tag="header"
            footer-tag="footer"
            footer=" "
        >
          <b-button variant="success" class="float-right" :to="{ name: 'ItCreate' }">Pievienot</b-button>

          <b-col cols="12" class="text-center" v-if="!loaded">
            <b-spinner variant="success" label="Spinning"></b-spinner>
          </b-col>

          <b-alert
              :show="dismissCountDown"
              v-if="created == 'success'"
              dismissible
              variant="success"
              @dismissed="dismissCountDown=0"
              @dismiss-count-down="countDownChanged"
          >
            <p>Problema tika veiksmīgi apskatīta!</p>
            <b-progress
                variant="success"
                :max="dismissSecs"
                :value="dismissCountDown"
                height="4px"
            ></b-progress>
          </b-alert>

          <b-alert
              :show="dismissCountDown"
              v-if="created == 'error'"
              dismissible
              variant="danger"
              @dismissed="dismissCountDown=0"
              @dismiss-count-down="countDownChanged"
          >
            <p>Ups! Notika kļūda</p>
            <b-progress
                variant="danger"
                :max="dismissSecs"
                :value="dismissCountDown"
                height="4px"
            ></b-progress>
          </b-alert>

          <b-row>
            <b-col lg="9" class="my-1">
              <b-form-group
                  class="m-1"
              >
                <b-input-group size="sm">
                  <b-form-input
                      id="filter-input"
                      v-model="searchInput"
                      :debounce="300"
                      type="search"
                      placeholder="Meklēt pēc vārda, uzvārda"
                  ></b-form-input>

                </b-input-group>
              </b-form-group>

              <b-form-group
                  class="m-1"
              >
                <b-input-group size="sm">
                  <b-form-select
                      v-model="selectedDateType"
                  >
                    <option :value="0" selected>Meklēt pēc uzdošanas datuma intervāla</option>
                    <option :value="1">Meklēt pēc termiņa datuma intervāla</option>
                  </b-form-select>
                  <b-form-input
                      placeholder="Iesniekšanas datums"
                      today-button
                      type="date"
                      v-model="dateStart"
                      reset-button
                      close-button
                      locale="lv"
                  ></b-form-input>
                  <b-form-input
                      placeholder="Termiņa datums"
                      today-button
                      type="date"
                      v-model="dateEnd"
                      reset-button
                      close-button
                      locale="lv"
                  ></b-form-input>
                </b-input-group>
              </b-form-group>
            </b-col>
          </b-row>

          <b-table striped hover responsive="true" small v-b-hover fixed
                   ref="table"
                   :items="items"
                   :fields="fields"
                   :no-provider-sorting="true"
                   @sort-changed="sortingChanged"
                   v-if="loaded">

            <template #cell(actions)="row">
              <b-button size="sm" variant="success" @click="$router.push({ name: 'ItFixer', params: {id: row.item.id} })" class="mr-1 mt-2">Skatīt/Deliģēt</b-button>
            </template>

            <template #cell(issue_date)="row">
              <span> {{ dateFormat(row.item.due_date, "dd.mm.yyyy") }} </span>
            </template>

            <template #cell(valid_date)="row">
              <span> {{ row.item.created_at ? dateFormat(row.item.created_at, "dd.mm.yyyy") : '' }} </span>
            </template>

          </b-table>


          <template v-if="isBusy && !noData">
            <div class="text-center text-success my-2">
              <b-spinner class="align-middle"></b-spinner>
              <strong> Problēma tiek iesniegta...</strong>
            </div>
          </template>

        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

const dateFormat = require('dateformat');

export default {
  name: "Saraksts",
  data() {
    return {
      dateFormat: dateFormat,
      documents: null,
      created: null,
      dismissSecs: 5,
      dismissCountDown: 0,
      currentPage: 1,
      noData: false,
      datePicker: {
        dateStart: null,
        dateEnd: null,
      },
      search: null,
      sort: null,
      isBusy: false,
      items: [],
      selectType: 0,
      searchString: '',
      fields: [
        { key: 'name', label: 'Vārds' },
        { key: 'surname', label: 'Uzvārds' },
        { key: 'problem_name', label: 'Uzdevums' },
        { key: 'problem_name', label: 'Uzdevuma apraksts' },
        { key: 'priority', label: 'Prioritāte', sortable: true },
        { key: 'structural_unit', label: 'Nodaļa', sortable: true },
        { key: 'room', label: 'Kabinets', sortable: true },
        { key: 'due_date', label: 'Termiņš', sortable: true },
        { key: 'created_at', label: 'Iesniegts', sortable: true},
        { key: 'namefixer', label: 'Labotāja vards ', sortable: true},
        { key: 'surnamefixer', label: 'Labotāja uzvards ', sortable: true},
        { key: 'actions', label: 'Darbības' },
      ],
      loaded: true,
    }
  },
  mounted() {
    let name = this.$route.params.name
    if(name) {
      let date = new Date();
      date.setFullYear(date.getFullYear()-3);

      this.datePicker.dateStart = date.toISOString();
      this.search = name;
      this.onFilter();
    } else {
      this.getData();
    }

    window.onscroll = () => {
      let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight === document.documentElement.offsetHeight;

      if (bottomOfWindow && !this.isBusy) {
        this.getData();
      }
    };
  },
  computed: {
    ...mapGetters ({
      options: "Options/options",
      User: "Auth/user",
    }),

    searchInput: {
      get() {
        return this.search;
      },
      set(value) {
        this.search = value;
        this.onFilter();
      }
    },
    selectedDateType: {
      get() {
        return this.selectType;
      },
      set(value) {
        this.selectType = value;
        this.onFilter();
      }
    },
    dateStart: {
      get() {
        return this.datePicker.dateStart;
      },
      set(value) {
        this.datePicker.dateStart = value;
        this.onFilter();
      }
    },
    dateEnd: {
      get() {
        return this.datePicker.dateEnd;
      },
      set(value) {
        this.datePicker.dateEnd = value;
        this.onFilter();
      }
    }
  },
  methods: {
    ...mapActions ({
      fetchOptions: "Options/fetchOptions"
    }),
    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },

    async getData() {
      this.isBusy = true;
      await axios.get('/problems').then(response => {

        let data = response.data.data;

        if(data.length) {
          this.items = this.items.concat(data);
          this.noData = false;
          this.isBusy = false;
        } else {
          this.noData = true;
        }
      }).catch(e => {
        this.isBusy = false;
      })

      this.currentPage++;
    },
    sortingChanged(ctx) {
      switch(ctx.sortBy) {
        case 'due_date':
          ctx.sortBy = 'due_date';
          break;
        case 'created_at':
          ctx.sortBy = 'created_at';
          break;
      }

      this.sort = {
        'field': ctx.sortBy,
        'sortDesc': ctx.sortDesc,
      }

      this.currentPage = 1;
      this.items = [];
      this.getData();
    },
    onFilter() {
      this.currentPage = 1;
      this.items = [];

      this.searchString = "";
      let dateType = "";

      switch(this.selectType) {
        case 0:
          dateType = 'due_date';
          break;

        case 1:
          dateType = 'created_at';
          break;
      }

      if(this.search)
        this.searchString += '&filter[name]='+this.search;

      if(this.datePicker['dateStart'] || this.datePicker['dateEnd'])
        this.searchString += '&filter['+dateType+']=';

      Object.keys(this.datePicker).forEach(e => {
        if(this.datePicker[e]) {
          if(e === 'dateEnd' && this.datePicker['dateStart']) {
            this.searchString += ','
          }
          this.searchString += this.datePicker[e]
        }
      })

      this.getData();
    },
  },
}
</script>

<style scoped>

</style>