
-- define all language properties

local lang = {
  common = {
    welcome = "Welcome. Use the phone keys to use the menu.~n~last login: {1}",
    no_player_near = "~r~No player near you.",
    invalid_value = "~r~Invalid value.",
    invalid_name = "~r~Invalid name.",
    not_found = "~r~Not found.",
    request_refused = "~r~Request refused.",
    wearing_uniform = "~r~Be careful, you are wearing a uniform."
  },
  survival = {
    starving = "STARVING",
    thirsty = "DEHYDRATED"
  },
  money = {
    display = "{1} <span class=\"symbol\">$</span>",
    given = "Given ~r~{1}$.",
    received = "Received ~g~{1}$.",
    not_enough = "~r~Not enough money.",
    paid = "Paid ~r~{1}$.",
    give = {
      title = "Give Money",
      description = "Give money to the nearest player.",
      prompt = "Amount to give:"
    }
  },
  inventory = {
    title = "Inventory",
    description = "Open the inventory.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "weight {1}/{2} kg",
    give = {
      title = "Give",
      description = "Give items to the nearest player.",
      prompt = "Amount to give (max {1}):",
      given = "Given ~r~{1} ~s~{2}.",
      received = "Received ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Trash",
      description = "Destroy items.",
      prompt = "Amount to trash (max {1}):",
      done = "Trashed ~r~{1} ~s~{2}."
    },
    missing = "~r~Missing {2} {1}.",
    full = "~r~Inventory full.",
    chest = {
      title = "Trunk",
      already_opened = "~r~The trunk is already opened by someone else.",
      full = "~r~Trunk full.",
      take = {
        title = "Take",
        prompt = "Amount to take (max {1}):"
      },
      put = {
        title = "Put",
        prompt = "Amount to put (max {1}):"
      }
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "Info",
      bank = "bank: {1} $"
    },
    deposit = {
      title = "Deposit",
      description = "wallet to bank",
      prompt = "Enter amount of money for deposit:",
      deposited = "~r~{1}$~s~ deposited."
    },
    withdraw = {
      title = "Withdraw",
      description = "bank to wallet",
      prompt = "Enter amount of money to withdraw:",
      withdrawn = "~g~{1}$ ~s~withdrawn.",
      not_enough = "~r~You don't have enough money in bank."
    }
  },
  business = {
    title = "Business Licenses",
    directory = {
      title = "Directory",
      description = "Business Directory.",
      dprev = "> Prev",
      dnext = "> Next",
      info = "<em>capital: </em>{1} $<br /><em>owner: </em>{2} {3}<br /><em>registration n°: </em>{4}<br /><em>phone: </em>{5}"
    },
    info = {
      title = "Business Info",
      info = "<em>name: </em>{1}<br /><em>capital: </em>{2} $<br /><em>capital transfer: </em>{3} $<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "Add Capital",
      description = "Add capital to your business.",
      prompt = "Amount to add to the business capital:",
      added = "~r~{1}$ ~s~added to the business capital."
    },
    launder = {
      title = "Money Laundering",
      description = "Use your business to launder dirty money.",
      prompt = "Amount of dirty money to launder (max {1} $): ",
      laundered = "~g~{1}$ ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "Open Business",
      description = "Open your business, minimum capital is {1} $.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~Business created."
      
    }
  },
  cityhall = {
    title = "Visa Office",
    identity = {
      title = "Create Character",
      description = "Create a new identity, cost = {1} $.",
      prompt_firstname = "Enter your first name:",
      prompt_name = "Enter your last name:",
      prompt_age = "Enter your age:",
    },
    menu = {
      title = "Identity",
      info = "<em>Name: </em>{1}<br /><em>First name: </em>{2}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}<br /><em>Address: </em>{7}, {6}"
    }
  },
  police = {
    wanted = "Wanted Rank {1}",
    not_handcuffed = "~r~Not Handcuffed",
    cloakroom = {
      title = "Locker Room",
      uniform = {
        title = "Gear Up",
        description = "Put on uniform and get your equipment."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "ID Search",
        description = "Search identity by registration.",
        prompt = "Enter registration number:"
      },
      closebusiness = {
        title = "Close business",
        description = "Close business of the nearest player.",
        request = "Are you sure to close the business {3} owned by {1} {2} ?",
        closed = "~g~Business closed."
      },
      trackveh = {
        title = "Track Vehicle",
        description = "Track a vehicle by its registration number.",
        prompt_reg = "Enter registration number:",
        prompt_note = "Enter a tracking note/reason:",
        tracking = "~b~Tracking started.",
        track_failed = "~b~Tracking of {1}~s~ ({2}) ~n~~r~Failed.",
        tracked = "Tracked {1} ({2})"
      },
      records = {
        show = {
          title = "Show Records",
          description = "Show police records by registration number."
        },
        delete = {
          title = "Clear Records",
          description = "Clear police records by registration number.",
          deleted = "~b~Police records deleted."
        }
      }
    },
    menu = {
      handcuff = {
        title = "Handcuff",
        description = "Handcuff/unhandcuff nearest player."
      },
      putinveh = {
        title = "Put In",
        description = "Put the nearest handcuffed player in the nearest vehicle."
      },
      getoutveh = {
        title = "Remove",
        description = "Removed handcuffed person from vehicle."
      },
      askid = {
        title = "Request ID",
        description = "Ask ID to see ID of the nearest player.",
        request = "Show your ID card?",
        request_hide = "Hide the ID card.",
        asked = "Requesting ID..."
      },
      check = {
        title = "Search Player",
        description = "Check money, inventory and weapons of the nearest player.",
        request_hide = "Hide the check report.",
        info = "<em>money: </em>{1} $<br /><br /><em>inventory: </em>{2}<br /><br /><em>weapons: </em>{3}",
        checked = "You have being searched."
      },
      seize = {
        seized = "Seized {2} ~r~{1}",
        weapons = {
          title = "Seize Weapons",
          description = "Seize nearest player weapons",
          seized = "~b~Your weapons have been seized."
        },
        items = {
          title = "Seize Items",
          description = "Seize illegal items",
          seized = "~b~Your illegal items has been seized."
        }
      },
      jail = {
        title = "Jail",
        description = "Jail/UnJail nearest player in/from the nearest jail.",
        not_found = "~r~No jail found.",
        jailed = "~b~Jailed.",
        unjailed = "~b~Released.",
        notify_jailed = "~b~You have been jailed.",
        notify_unjailed = "~b~You have been released."
      },
      fine = {
        title = "Fine",
        description = "Fine the nearest player.",
        fined = "~b~Fined ~s~{2} $ for ~b~{1}.",
        notify_fined = "~b~You have been fined ~s~ {2} $ for ~b~{1}.",
        record = "[Fine] {2} $ for {1}"
      }
    },
    identity = {
      info = "<em>Name: </em>{1}<br /><em>First name: </em>{2}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}<br /><em>Business: </em>{6}<br /><em>Business capital: </em>{7} $<br /><em>Address: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Reanimate",
        description = "Revive the nearest player.",
        not_in_coma = "~r~Not unconscious."
      }
    }
  },
  phone = {
    title = "Phone",
    directory = {
      title = "Directory",
      description = "Open the phone directory.",
      add = {
        title = "> Add",
        prompt_number = "Enter the phone number to add:",
        prompt_name = "Enter the entry name:",
        added = "~g~Entry added."
      },
      sendsms = {
        title = "Send SMS",
        prompt = "Enter the message (max {1} chars):",
        sent = "~g~ Sent to n°{1}.",
        not_sent = "~r~ n°{1} unavailable."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "Remove"
      }
    },
    sms = {
      title = "SMS History",
      description = "Received SMS history.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "Service",
      description = "Call a service or an emergency number.",
      prompt = "If needed, enter a message for the service:",
      ask_call = "Received {1} call, take it? <em>{2}</em>",
      taken = "~r~This call is already taken."
    }
  },
  emotes = {
    title = "Emotes",
    clear = {
      title = "> Clear",
      description = "Clear all running emotes."
    }
  },
  home = {
    buy = {
      title = "Buy",
      description = "Buy a home here, price is {1} $.",
      bought = "~g~Bought.",
      full = "~r~The place is full.",
      have_home = "~r~You already have a home."
    },
    sell = {
      title = "Sell",
      description = "Sell your home for {1} $",
      sold = "~g~Sold.",
      no_home = "~r~You don't have a home here."
    },
    intercom = {
      title = "Intercom",
      description = "Use the intercom to enter a home.",
      prompt = "Number:",
      not_available = "~r~Not available.",
      refused = "~r~Refused.",
      prompt_who = "Say who you are:",
      asked = "Asking...",
      request = "Someone wants to visit your home: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Leave"
      },
      ejectall = {
        title = "Eject all",
        description = "Eject all home visitors, including you, and close the home."
      }
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Owned Vehicles",
      description = "Owned vehicles."
    },
    buy = {
      title = "Buy a Vehicle",
      description = "Buy vehicles.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Sell a Vehicle",
      description = "Sell vehicles."
    },
    rent = {
      title = "Rent a Vehicle",
      description = "Rent a vehicle for the session (until you disconnect)."
    },
    store = {
      title = "Store in Garage",
      description = "Put your current vehicle in the garage."
    }
  },
  vehicle = {
    title = "Vehicle",
    no_owned_near = "~r~No owned vehicle near.",
    trunk = {
      title = "Trunk",
      description = "Open the vehicle trunk."
    },
    detach_trailer = {
      title = "Detach Trailer",
      description = "Detach trailer."
    },
    detach_towtruck = {
      title = "Detach Tow Truck",
      description = "Detach tow truck."
    },
    detach_cargobob = {
      title = "Detach Cargobob",
      description = "Detach cargobob."
    },
    lock = {
      title = "Lock/unlock",
      description = "Lock or unlock the vehicle."
    },
    engine = {
      title = "Engine on/off",
      description = "Start or stop the engine."
    },
    asktrunk = {
      title = "Request Trunk Open",
      asked = "~g~Requesting...",
      request = "You are requested to open the trunk."
    },
    replace = {
      title = "Flip Vehicle",
      description = "Flip the nearest vehicle onto it's wheels."
    },
    repair = {
      title = "Repair Vehicle",
      description = "Repair the nearest vehicle."
    }
  },
  gunshop = {
    title = "AmmuNation ({1})",
    prompt_ammo = "Amount of ammo to buy for the {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammo: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Store ({1})",
    prompt = "Amount of {1} to buy:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Clothing Shop"
  },
  cloakroom = {
    title = "Locker Room ({1})",
    undress = {
      title = "> Street Clothes"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal Informer",
      description = "{1} $",
      bought = "~g~Position sent to your GPS."
    }
  },
  mission = {
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Cancel mission"
    }
  }
}

return lang
